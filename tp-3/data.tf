data "google_compute_address" "ip_address" {
  name   = "lewisip-public"
  region = var.region
}


data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}
