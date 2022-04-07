resource "google_storage_bucket_object" "file" {
  name   = var.jobFileNameGCS
  source = var.jobFilePath
  bucket = var.bucketName
}