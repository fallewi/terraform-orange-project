
//resource "google_compute_instance" "default" {
//  name         = "terraform-fall-lewis"
//  machine_type = "e2-micro"


//  boot_disk {
//    initialize_params {
//      image = "debian-cloud/debian-11"
//    }
//  }


//  network_interface {
//    network = google_compute_network.vpc_network.self_link

//    access_config {
      // Ephemeral public IP
//    }
//  }
//}


resource "google_compute_network" "vpc_network" {
  name = "vpc-network-lewis"
  auto_create_subnetworks = true
}
