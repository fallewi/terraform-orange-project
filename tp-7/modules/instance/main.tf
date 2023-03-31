data "google_compute_address" "ip_address" {
  name   = "${var.maintainer}-public"
  region = var.region
}


data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance" "default" {
  name         = "terraform-${var.maintainer}"
  machine_type =  var.instance_template
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
    subnetwork = var.subnet_id

    access_config {
      nat_ip = data.google_compute_address.ip_address.id
    }
  }
}
