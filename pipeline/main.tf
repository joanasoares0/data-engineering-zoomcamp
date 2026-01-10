terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.15.0"
    }
  }
}

provider "google" {
  # if you want to use the var credentials:
  # credentials = file(var.credentials)

  # Configuration options
  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "demo-bucket" {
  # Globally unique bucket name
  name = var.gcs_bucket_name

  # Region where the bucket will be created
  location = var.location

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

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_name

  # EU = multi-region (covers europe-west1, europe-west4, etc.)
  location = var.location

  # Allows Terraform to delete all tables inside the dataset on destroy
  delete_contents_on_destroy = true
}
