resource "google_storage_bucket" "assets" {
  name          = var.assets_bucket_name
  project       = var.project
  location      = var.region
  force_destroy = true
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.assets.name
  role   = "READER"
  entity = "allUsers"
}