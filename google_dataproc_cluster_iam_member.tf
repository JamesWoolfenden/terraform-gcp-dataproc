resource "google_dataproc_cluster_iam_member" "readers" {
  for_each = toset(var.readers)
  cluster  = google_dataproc_cluster.main.name
  region   = var.region
  role     = "roles/dataproc.viewer"
  member   = each.value
}
