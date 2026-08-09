resource "google_secret_manager_secret" "kerberos" {
  secret_id = "dataproc-kerberos-password"

  replication {
    auto {}
  }

  rotation {
    rotation_period   = "2592000s" # 30 days
    next_rotation_time = timeadd(timestamp(), "2592000s")
  }
}

resource "google_secret_manager_secret_version" "kerberos" {
  secret      = google_secret_manager_secret.kerberos.id
  secret_data = "placeholder-rotated-out-of-band"
}
