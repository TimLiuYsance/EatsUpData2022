import argparse


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
        type=list,
        required=True
    )

    args = parser.parse_args()

    print('----------------------------------------------------------------')
    print('in the test job heeh')
    print(f'{args.bucketName}')
    print(f'{args.foldersData}')
    print('----------------------------------------------------------------')