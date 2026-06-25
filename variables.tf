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

  validation {
    condition     = length(trimspace(var.kerberos_root_principal_password_uri)) > 0
    error_message = "var.kerberos_root_principal_password_uri must be a non-empty string"
  }
}

variable "kerberos_kms_key" {
  type        = string
  description = "CMEK key used to decrypt the Kerberos root principal password"

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
