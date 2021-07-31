terraform {
  backend "gcs" {
    bucket      = "plate_terraform"
    prefix      = "production/state"
    credentials = "./service-account.json"
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = "./service-account.json"
}

module "storage" {
  source                      = "../../modules/storage"
  name                        = var.name
  project                     = var.project
  region                      = var.region
  terraform_state_bucket_name = var.terraform_state_bucket_name
  assets_bucket_name          = var.assets_bucket_name
}
