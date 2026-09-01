resource "google_dataproc_cluster_iam_binding" "editors" {
  count = length(var.cluster_editors) == 0 ? 0 : 1

  cluster = google_dataproc_cluster.main.name
  region  = google_dataproc_cluster.main.region
  role    = "roles/dataproc.editor"
  members = var.cluster_editors
}
