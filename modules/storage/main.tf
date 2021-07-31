resource "google_storage_bucket" "assets" {
  name          = var.assets_bucket_name
  project       = var.project
  location      = var.region
  force_destroy = true
}
