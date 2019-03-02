terraform {
  required_version = ">= 0.11.7"

  backend "gcs" {}
}

provider "google" {
  version = "1.16.0"
  project = "${var.project}"
  region  = "${var.region}"
}

provider "template" {
  version = "1.0.0"
}
