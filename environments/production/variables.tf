variable "name" {
  default = "plate"
}

variable "env" {
  default = "production"
}

variable "project" {
  default = "direct-electron-320101"
}

variable "credentials" {
  default = "./service-account.json"
}

variable "region" {
  default = "asia-northeast1"
}

variable "terraform_state_bucket_name" {
  default = "plate_terraform"
}

variable "assets_bucket_name" {
  default = "plate_assets"
}

# variable "firebase_account" {}

# variable "cloud_storage_account" {}

variable "database_instance_name" {
  default = "plate"
}

variable "database_name" {
  default = "plate_db"
}

variable "database_master_user_name" {}

variable "database_master_user_password" {}