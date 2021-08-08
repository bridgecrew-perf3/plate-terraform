resource "google_sql_database_instance" "master" {
  name             = var.database_instance_name
  project          = var.project
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.master.name
}

resource "google_sql_user" "user" {
  name     = var.database_master_user_name
  instance = google_sql_database_instance.master.name
  password = var.database_master_user_password
}
