.ONESHELL:

.PHONY: clean install run all

clean:
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.log' -delete
	find . -type d -name '__pycache__' -delete

install:
	python -m venv .venv; \
	source .venv/bin/activate; \
	pip install -r requirements.txt;

run:
	source .venv/bin/activate; \
	python src/main.py --project_id ysance-eatsupdata-1 --region europe-west1 --cluster_name test-cluster --job_file_path src/jobs/job_test.py --bucket_id ysance-eatsupdata-1-test_bucket

all: clean install run
