resource "google_dataproc_workflow_template" "template-geosante" {
  name = var.workflowTemplateName
  location = var.region
  placement {
    managed_cluster {
      cluster_name = var.clusterName
      config {
        gce_cluster_config {
          zone = "${var.region}-b"
        }
      }
    }
  }
  jobs {
    step_id = var.jobName
    pyspark_job {
      main_python_file_uri = "gs://${var.bucketName}/${var.jobFileNameGCS}"
      args = ["--bucketName=${var.bucketName}", "--folders=${var.foldersData}"]
    }
  }
}

