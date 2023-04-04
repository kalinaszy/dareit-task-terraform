resource "google_storage_bucket" "dareit-tf-three" {
  name     = "dareit-tf-three"
  location = "us-central1"
}

resource "google_compute_instance" "dareit-vm-ci-three" {
  name         = "dareit-vm-tf-ci-three"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["dareit"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}