resource "google_cloud_scheduler_job" "job" {
  name             = var.jobName
  schedule         = "0 9 * * 1"
  time_zone        = "Europe/Paris"
  attempt_deadline = "320s"

  retry_config {
    retry_count = 1
  }

  http_target {
    http_method = "POST"
    uri         = "https://dataproc.googleapis.com/v1/projects/${var.project}/regions/${var.region}/workflowTemplates/${var.workflowTemplateName}:instantiate?alt=json"
    oauth_token {
      service_account_email = var.serviceAccountEmail
    }
  }
}
