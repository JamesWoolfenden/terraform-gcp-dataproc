variable "name" {
  type        = string
  description = "Name of the Dataproc cluster"

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "var.name must be a non-empty string"
  }
}

variable "region" {
  type        = string
  description = "Region for the Dataproc cluster"

  validation {
    condition     = length(trimspace(var.region)) > 0
    error_message = "var.region must be a non-empty string"
  }
}

variable "kms_key_name" {
  type        = string
  description = "CMEK key used to encrypt cluster persistent disks and job outputs"
  sensitive   = true

  validation {
    condition     = length(trimspace(var.kms_key_name)) > 0
    error_message = "var.kms_key_name must be a non-empty string"
  }
}

variable "subnetwork" {
  type        = string
  description = "Self-link of the subnetwork for cluster nodes"

  validation {
    condition     = length(trimspace(var.subnetwork)) > 0
    error_message = "var.subnetwork must be a non-empty string"
  }
}

variable "service_account" {
  type        = string
  description = "Service account email used by cluster VMs"

  validation {
    condition     = length(trimspace(var.service_account)) > 0
    error_message = "var.service_account must be a non-empty string"
  }
}

variable "kerberos_root_principal_password_uri" {
  type        = string
  description = "Secret Manager secret version URI holding the Kerberos root principal password"
  sensitive   = true

  validation {
    condition     = length(trimspace(var.kerberos_root_principal_password_uri)) > 0
    error_message = "var.kerberos_root_principal_password_uri must be a non-empty string"
  }
}

variable "kerberos_kms_key" {
  type        = string
  description = "CMEK key used to decrypt the Kerberos root principal password"
  sensitive   = true

  validation {
    condition     = length(trimspace(var.kerberos_kms_key)) > 0
    error_message = "var.kerberos_kms_key must be a non-empty string"
  }
}

variable "readers" {
  type        = list(string)
  description = "Identities granted dataproc.viewer on the cluster"
  default     = []

  validation {
    condition     = alltrue([for r in var.readers : !contains(["allUsers", "allAuthenticatedUsers"], r)])
    error_message = "var.readers must not contain allUsers or allAuthenticatedUsers"
  }
}

variable "idle_delete_ttl" {
  type        = string
  description = "Duration (e.g. \"1800s\") after which an idle cluster is automatically deleted. Null to disable auto-deletion for long-running clusters"
  default     = null

  validation {
    condition     = var.idle_delete_ttl == null || can(regex("^[0-9]+s$", var.idle_delete_ttl))
    error_message = "var.idle_delete_ttl must be null or a duration string like \"1800s\""
  }
}

variable "staging_bucket" {
  type        = string
  description = "GCS bucket for cluster staging data (job dependencies, etc.). Null lets Dataproc auto-provision an unmanaged bucket"
  default     = null

  validation {
    condition     = var.staging_bucket == null || length(trimspace(var.staging_bucket)) > 0
    error_message = "var.staging_bucket must be null or a non-empty string"
  }
}

variable "temp_bucket" {
  type        = string
  description = "GCS bucket for cluster temp/ephemeral data. Null lets Dataproc auto-provision an unmanaged bucket"
  default     = null

  validation {
    condition     = var.temp_bucket == null || length(trimspace(var.temp_bucket)) > 0
    error_message = "var.temp_bucket must be null or a non-empty string"
  }
}

variable "labels" {
  type        = map(string)
  description = "Labels applied to the cluster for cost allocation and ownership tracking"
  default     = {}

  validation {
    condition     = alltrue([for k, v in var.labels : can(regex("^[a-z0-9_-]{1,63}$", k)) && can(regex("^[a-z0-9_-]{0,63}$", v))])
    error_message = "var.labels keys and values must be lowercase letters, numbers, underscores, or dashes (GCP label constraints)"
  }
}

variable "image_version" {
  type        = string
  description = "Dataproc image version to pin the cluster to, so upgrades happen deliberately rather than by picking up whatever GCP's default is on creation/recreation"
  default     = "2.2-debian12"

  validation {
    condition     = length(trimspace(var.image_version)) > 0
    error_message = "var.image_version must be a non-empty string"
  }
}

variable "cluster_editors" {
  type        = list(string)
  description = "Principals granted roles/dataproc.editor on the cluster, authoritatively for that role. Empty to create no binding"
  default     = []

  validation {
    condition     = !anytrue([for m in var.cluster_editors : contains(["allUsers", "allAuthenticatedUsers"], m)])
    error_message = "var.cluster_editors must not contain allUsers or allAuthenticatedUsers"
  }
}
