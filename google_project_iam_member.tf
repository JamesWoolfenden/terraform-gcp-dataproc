resource "google_project_iam_member" "cluster_sa_worker" {
  project = data.google_project.current.project_id
  role    = "roles/dataproc.worker"
  member  = "serviceAccount:${var.service_account}"
}
