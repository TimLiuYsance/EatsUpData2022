provider "google" {
  project = var.project
  region  = var.region
  credentials = "${file("../ysance-eatsupdata-1-service-account.json")}"
}
