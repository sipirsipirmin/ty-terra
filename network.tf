resource "google_compute_network" "vpc_network" {
  name                    = var.network
  project                 = var.project
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"

}

resource "google_compute_subnetwork" "ci-subnet" {
  name          = var.ci_subnet_name
  ip_cidr_range = var.ci_subnet
  region        = "europe-west1"
  network       = var.network
  project       = var.project
}


resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ci-subnet-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "all"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80"]
  }
  source_ranges = ["0.0.0.0/0"]

}