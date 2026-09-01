resource "google_secret_manager_secret_iam_member" "kerberos_secret" {
  secret_id = local.kerberos_secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = local.dataproc_service_agent
}
