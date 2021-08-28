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

module "sql" {
  source                        = "../../modules/sql"
  name                          = var.name
  project                       = var.project
  region                        = var.region
  database_instance_name        = var.database_instance_name
  database_name                 = var.database_name
  database_master_user_name     = var.database_master_user_name
  database_master_user_password = var.database_master_user_password
}

module "run" {
  source                            = "../../modules/run"
  name                              = var.name
  region                            = var.region
  image                             = "gcr.io/${var.project}/${var.name}-api:cefdaf5f91865659f9a6cda3d03ab24f5d25c92e"
  database_instance_connection_name = module.sql.connection_name
  env                               = var.env
  db_driver                         = "mysql"
  db_user                           = module.sql.user_name
  db_pass                           = module.sql.user_password
  db_name                           = module.sql.database_name
  firebase_sa                       = var.firebase_sa
  assets_name                       = var.assets_bucket_name
  allow_origin                      = "https://plate-97baf.web.app"
}
