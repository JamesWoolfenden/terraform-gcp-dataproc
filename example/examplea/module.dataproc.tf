# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "dataproc" {
  source                               = "../../"
  name                                 = "example-cluster"
  region                               = "europe-west2"
  kms_key_name                         = google_kms_crypto_key.main.id
  subnetwork                           = google_compute_subnetwork.nodes.self_link
  service_account                      = google_service_account.dataproc.email
  kerberos_root_principal_password_uri = google_secret_manager_secret_version.kerberos.name
  kerberos_kms_key                     = google_kms_crypto_key.kerberos.id
}
