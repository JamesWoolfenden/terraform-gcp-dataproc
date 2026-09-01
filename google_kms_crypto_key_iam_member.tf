resource "google_kms_crypto_key_iam_member" "cluster_key" {
  crypto_key_id = var.kms_key_name
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = local.dataproc_service_agent
}

resource "google_kms_crypto_key_iam_member" "kerberos_key" {
  crypto_key_id = var.kerberos_kms_key
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = local.dataproc_service_agent
}
