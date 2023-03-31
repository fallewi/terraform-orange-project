resource "google_compute_firewall" "web" {
  name    = "web-firewall-${var.maintainer}"
  network = var.vpc_id


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.maintainer}"]
}

resource "google_compute_firewall" "ssh" {
  name    = "ssh-firewall-${var.maintainer}"
  network = var.vpc_id


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.maintainer}"]
}


