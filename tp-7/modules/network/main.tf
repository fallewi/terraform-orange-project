resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network-${var.maintainer}"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "lewis-subnet" {
  name          = "subnet-${var.maintainer}"
  ip_cidr_range = var.cidr_range
  network       = google_compute_network.vpc_network.id
}

