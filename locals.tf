locals {
  # The Cloud Dataproc Service Agent — the identity GCP uses internally to
  # create the cluster, and the one that must be able to decrypt the CMEK
  # keys and read the Kerberos secret this module wires in by reference.
  dataproc_service_agent = "serviceAccount:service-${data.google_project.current.number}@dataproc-accounts.iam.gserviceaccount.com"

  # kerberos_root_principal_password_uri is a secret *version* URI
  # ("projects/P/secrets/S/versions/V"); IAM is granted on the secret itself.
  kerberos_secret_id = split("/versions/", var.kerberos_root_principal_password_uri)[0]
}
