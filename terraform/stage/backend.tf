terraform {
  backend "gcs" {
    bucket = "tf-bucket-stage"
    prefix = "terraform/stage"
  }
}
