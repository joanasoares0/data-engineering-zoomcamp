terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.15.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "dtc-de-course-483520"
  region  = "europe-west1"
}

resource "google_storage_bucket" "demo-bucket" {
  # Globally unique bucket name
  name          = "dtc-de-course-483520-terra-bucket"

  # Region where the bucket will be created
  # europe-west1 = Belgium (closest stable region to Portugal)
  location      = "europe-west1"

  # Allows Terraform to delete the bucket even if it contains objects
  force_destroy = true

  # Automatically delete objects older than 1 day
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
