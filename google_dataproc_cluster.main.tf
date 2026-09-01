resource "google_dataproc_cluster" "main" {
  name   = var.name
  region = var.region
  labels = var.labels

  cluster_config {
    staging_bucket = var.staging_bucket
    temp_bucket    = var.temp_bucket

    encryption_config {
      kms_key_name = var.kms_key_name
    }

    software_config {
      image_version = var.image_version
    }

    dynamic "lifecycle_config" {
      for_each = var.idle_delete_ttl == null ? [] : [var.idle_delete_ttl]
      content {
        idle_delete_ttl = lifecycle_config.value
      }
    }

    gce_cluster_config {
      internal_ip_only = true
      subnetwork       = var.subnetwork
      service_account  = var.service_account

      shielded_instance_config {
        enable_secure_boot          = true
        enable_vtpm                 = true
        enable_integrity_monitoring = true
      }
    }

    security_config {
      kerberos_config {
        enable_kerberos             = true
        root_principal_password_uri = var.kerberos_root_principal_password_uri
        kms_key_uri                 = var.kerberos_kms_key
      }
    }
  }
}
