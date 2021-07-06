resource "google_service_account" "service_account" {
  account_id   = "ci-instance-sa"
  display_name = "Service Account"
}

resource "google_compute_instance" "kubernetes-master" {
  name         = "kubernetes-master"
  machine_type = "n1-standard-2"
  zone         = "europe-west1-d"

  tags = ["jenkins"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20210701"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.network
    subnetwork = var.ci_subnet_name
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "kubernetes-node-1" {
  name         = "kubernetes-node-1"
  machine_type = "n1-standard-2"
  zone         = "europe-west1-d"

  tags = ["jenkins"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20210701"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.network
    subnetwork = var.ci_subnet_name
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "prometheus" {
  name         = "federation-prometheus-consul-server"
  machine_type = "n1-standard-2"
  zone         = "europe-west1-d"

  tags = ["jenkins"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20210701"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.network
    subnetwork = var.ci_subnet_name
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "gitlab-elastic" {
  name         = "gitlab-elastic"
  machine_type = "n1-standard-2"
  zone         = "europe-west1-d"

  tags = ["jenkins"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20210701"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.network
    subnetwork = var.ci_subnet_name
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }
}