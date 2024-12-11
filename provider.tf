terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
  }
}
provider "google" {
  project = "terra-learn-p01"
  region  = "asia-east1"
}