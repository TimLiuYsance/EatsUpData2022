from google.cloud import bigquery
import pandas as pd
import argparse
import subprocess


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "--bucketName",
        type=str,
        required=True
    )
    parser.add_argument(
        "--foldersData",
        type=str,
        required=True
    )

    args = parser.parse_args()

    bucketName = args.bucketName
    foldersData = args.foldersData.split(',')

    all_data = []
    for folder in foldersData:
        result = subprocess.run(['gsutil', 'ls', f'gs://{bucketName}/{folder}/*.csv'], stdout=subprocess.PIPE)

        all_data_in_folder = pd.DataFrame()
        for file in result.stdout.splitlines():
            dat = pd.read_csv(file.strip().decode("utf-8"))
            all_data_in_folder = pd.concat([all_data_in_folder, dat], ignore_index=True)
        all_data.append(all_data_in_folder)

    result = pd.DataFrame(columns=["Entity", "Code", "Year"])
    for df in all_data:
        result = pd.merge(result, df, how="outer", on=["Entity", "Code", "Year"])

    # Construct a BigQuery client object.
    client = bigquery.Client('ysance-eatsupdata-1')

    # TODO(developer): Set table_id to the ID of the table to create.
    table_id = "ysance-eatsupdata-1.data_geo_sante.cancer_airpollution_beer_smoke_wine"


    job_config = bigquery.LoadJobConfig(
        write_disposition="WRITE_TRUNCATE",
    )

    job = client.load_table_from_dataframe(
        result, table_id, job_config=job_config
    )  # Make an API request.
    job.result()  # Wait for the job to complete.

    table = client.get_table(table_id)  # Make an API request.
    print(
        "Loaded {} rows and {} columns to {}".format(
            table.num_rows, len(table.schema), table_id
        )
    )