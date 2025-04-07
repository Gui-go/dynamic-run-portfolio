

resource "google_cloud_run_service" "tf_run_service" {
  project  = var.proj_id
  name     = "dynamic-run-portfolio"
  location = var.location
  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/dynamic-run-portfolio1/dynamic-run-portfolio-repo/dynamic-run-portfolio:latest"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_domain_mapping" "custom_domain" {
  project  = var.proj_id
  location = var.location
  name     = "www.guigo.dev.br"
  metadata {
    namespace = var.proj_id
  }
  spec {
    route_name = google_cloud_run_service.tf_run_service.name
  }
}

resource "google_cloud_run_service_iam_member" "public_access" {
  project  = var.proj_id
  service  = google_cloud_run_service.tf_run_service.name
  location = google_cloud_run_service.tf_run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "service_url" {
  value = "https://${google_cloud_run_domain_mapping.custom_domain.name}"
}

