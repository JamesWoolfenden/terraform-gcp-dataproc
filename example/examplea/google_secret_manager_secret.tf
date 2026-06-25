resource "google_secret_manager_secret" "kerberos" {
  secret_id = "dataproc-kerberos-password"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "kerberos" {
  secret      = google_secret_manager_secret.kerberos.id
  secret_data = "placeholder-rotated-out-of-band"
}
