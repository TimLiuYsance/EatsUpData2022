variable "project" {
  type        = string
  default     = "ysance-eatsupdata-1"
}

variable "environment" {
  type        = string
  default     = "dv"
}

variable "region" {
  type        = string
  default     = "europe-west1"
}

variable "location" {
  type        = string
  default     = "EU"
}

variable "workflowTemplateName" {
  type        = string
  default     = "template-geosante"
}

variable "clusterName" {
  type        = string
  default     = "cluster-geosante"
}

variable "jobName" {
  type        = string
  default     = "job-geosante"
}

variable "serviceAccountEmail" {
  type        = string
  default     = "ysance-eatsupdata-1-service-ac@ysance-eatsupdata-1.iam.gserviceaccount.com"
}

variable "jobFilePath" {
  type        = string
  default     = "../src/jobs/job_test.py"
}

variable "bucketName" {
  type        = string
  default     = "ysance-eatsupdata-1-test_bucket"
}

variable "jobFileNameGCS" {
  type        = string
  default     = "job.py"
}
