provider "google" {
  project = "terraform-379914"
  region  = "us-central1"
  zone    = "us-central1-c"
}

terraform {
  backend "gcs" {
    bucket = "terraform-backend-bucket-lewis"
    prefix = "terraform/state"
  }
}

