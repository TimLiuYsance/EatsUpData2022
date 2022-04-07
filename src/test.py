from google.cloud import storage

def upload_file_to_gcs():
    print(storage.Client().get_bucket('ysance-eatsupdata-1-test_bucket').blob('job_test_copy_2.py').upload_from_filename('/Users/tliu/Documents/office/projects/ysance/EatsUpData2022/src/jobs/job_test_copy_2.py'))

upload_file_to_gcs()