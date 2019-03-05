resource "google_compute_network" "network" {
  name                    = "${var.project}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${google_compute_network.network.name}-subnet"
  region        = "${var.region}"
  ip_cidr_range = "10.2.0.0/16"
  network       = "${google_compute_network.network.self_link}"
}
