# holden:ignore:HLD_GCP_123 — rotated out-of-band by an external process (see
# the placeholder secret_version below); a Pub/Sub-notified rotation_period
# here would be invalid HCL without a matching topic and would only track
# Terraform's own re-apply cadence, not the actual out-of-band rotation.
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
