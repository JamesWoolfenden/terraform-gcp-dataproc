# holden:ignore:HLD_GCP_094: Just enough to drive the module
# holden:ignore:HLD_GCP_303: Just enough to drive the module
# holden:ignore:HLD_GCP_093: Just enough to drive the module
resource "google_compute_network" "private" {
  name                    = "dataproc-private"
  auto_create_subnetworks = false
}

# holden:ignore:HLD_GCP_026: Just enough to drive the example
resource "google_compute_subnetwork" "nodes" {
  name                     = "dataproc-nodes"
  ip_cidr_range            = "10.91.0.0/24"
  region                   = "europe-west2"
  network                  = google_compute_network.private.id
  private_ip_google_access = true
}
