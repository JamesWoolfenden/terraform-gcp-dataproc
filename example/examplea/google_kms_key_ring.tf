resource "google_kms_key_ring" "main" {
  name     = "dataproc-keyring"
  location = "europe-west2"
}

resource "google_kms_crypto_key" "main" {
  name     = "dataproc-key"
  key_ring = google_kms_key_ring.main.id

  lifecycle {
    prevent_destroy = true
  }
  rotation_period = "100000s"
}

resource "google_kms_crypto_key" "kerberos" {
  name     = "dataproc-kerberos-key"
  key_ring = google_kms_key_ring.main.id

  lifecycle {
    prevent_destroy = true
  }
  rotation_period = "100000s"
}
