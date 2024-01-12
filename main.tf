resource "google_compute_instance" "my_instance" {
  name                      = "terraform-instance"
  machine_type              = "e2-micro"
  zone                      = "${var.region}-b"
  allow_stopping_for_update = "true"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = google_compute_network.terraform_network.self_link
    subnetwork = google_compute_subnetwork.terraform_subnetwork.self_link
    access_config {
    }
  }

  depends_on = [google_project_service.main]
}

resource "google_compute_network" "terraform_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform_subnetwork" {
  name          = "terraform-subnetwork"
  ip_cidr_range = "10.20.0.0/16"
  region        = var.region
  network       = google_compute_network.terraform_network.id
}

resource "google_project_service" "main" {
  for_each = toset(var.project_services)

  project                    = var.project_id
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = false
}
