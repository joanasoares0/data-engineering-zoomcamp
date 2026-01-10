# If you want Terraform to use this credentials file,
# make sure you FIRST unset any previously exported GCP credentials:
#   unset GOOGLE_APPLICATION_CREDENTIALS
#
# Otherwise Terraform will ignore this variable and continue using
# the environment variable instead.
variable "credentials" {
  description = "Path to the GCP service account key used by Terraform"
  default     = "./gcp/dtc-de-course-483520-0e0de2970530.json"
}

variable "project" {
  description = "Project "
  default     = "dtc-de-course-483520"
}

variable "region" {
  description = "Project Region"
  default     = "europe-west1"
}

variable "location" {
  description = "Project Location"
  default     = "EU"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "dtc-de-course-483520-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "Standard"
}