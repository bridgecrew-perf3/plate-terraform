resource "google_cloud_run_service" "api" {
  name     = var.name
  location = var.region
  template {
    spec {
      containers {
        image = var.image
        env {
          name = "ENV"
          value = var.env
        }
        env {
          name = "API_PORT"
          value = "8080"
        }
        env {
          name = "FIREBASE_SA"
          value = var.firebase_sa
        }
        env {
          name = "DB_DRIVER"
          value = var.db_driver
        }
        env {
          name = "DB_USER"
          value = var.db_user
        }
        env {
          name = "DB_PASS"
          value = var.db_pass
        }
        env {
          name = "DB_NAME"
          value = var.db_name
        }
        env {
          name = "DB_CONECTION_NAME"
          value = var.database_instance_connection_name
        }
        env {
          name = "ASSETS_NAME"
          value = var.assets_name
        }
        env {
          name = "ACCESS_CONTROL_ALLOW_ORIGIN"
          value = var.allow_origin
        }
      }
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "1000"
        "run.googleapis.com/cloudsql-instances" = var.database_instance_connection_name
        "run.googleapis.com/client-name"        = "terraform"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
  autogenerate_revision_name = true
}


data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.api.location
  project     = google_cloud_run_service.api.project
  service     = google_cloud_run_service.api.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
