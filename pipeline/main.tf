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
  project = "my-project-id"
  region  = "us-central1"
}