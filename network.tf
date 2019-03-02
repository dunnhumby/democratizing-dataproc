resource "google_compute_network" "democratising-dataproc-network" {
  name                    = "democratising-dataproc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "democratising-dataproc-subnet" {
  name          = "${google_compute_network.democratising-dataproc-network.name}-subnet"
  region        = "${var.region}"
  ip_cidr_range = "10.2.0.0/16"
  network       = "${google_compute_network.democratising-dataproc-network.self_link}"
}
