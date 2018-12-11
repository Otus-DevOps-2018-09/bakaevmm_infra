terraform {
  backend "gcs" {
    bucket = "tf-bucket-prod"
    prefix = "terraform/prod"
  }
}
