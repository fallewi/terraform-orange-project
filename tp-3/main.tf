
resource "google_compute_instance" "default" {
  name         = "terraform-fall-lewis"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  provisioner "local-exec" {
    command = "echo ${google_compute_instance.default.name}: ${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}: >> info_ec2.txt"
  }


  metadata_startup_script = "sudo apt-get update; sudo apt-get install nginx -y; sudo systemctl enable --now nginx"
  network_interface {
    subnetwork = google_compute_subnetwork.lewis-subnet.id

    access_config {
      nat_ip = data.google_compute_address.ip_address.id
    }
  }
}

resource "google_compute_subnetwork" "lewis-subnet" {


  name          = "lewis-subnet"
  ip_cidr_range = "10.1.0.0/24"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network-lewis"
  auto_create_subnetworks = false
}


resource "google_compute_firewall" "web" {
  name    = "web-firewall-lewis"
  network = google_compute_network.vpc_network.id


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "ssh" {
  name    = "ssh-firewall-lewis"
  network = google_compute_network.vpc_network.id


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

