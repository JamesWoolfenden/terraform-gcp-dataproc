resource "google_service_account" "dataproc" {
  account_id   = "dataproc-cluster"
  display_name = "Dataproc cluster service account"
}
