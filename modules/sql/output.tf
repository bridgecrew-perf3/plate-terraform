output "connection_name" {
  value = google_sql_database_instance.master.connection_name
}

output "database_name" {
  value = google_sql_database.database.name
}

output "user_name" {
  value = google_sql_user.user.name
}

output "user_password" {
  value = google_sql_user.user.password
}
