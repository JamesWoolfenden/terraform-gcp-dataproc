resource "google_compute_network" "private" {
  name                    = "dataproc-private"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "nodes" {
  name                     = "dataproc-nodes"
  ip_cidr_range            = "10.91.0.0/24"
  region                   = "europe-west2"
  network                  = google_compute_network.private.id
  private_ip_google_access = true
}
