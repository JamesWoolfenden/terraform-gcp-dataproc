# terraform-gcp-dataproc

Terraform module for Cloud Dataproc. Exercises holden's `policies/gcp/dataproc` policy set.

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
# apply role
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "cloudkms.cryptoKeys.getIamPolicy",
    "cloudkms.cryptoKeys.setIamPolicy",
    "dataproc.clusters.create",
    "dataproc.clusters.delete",
    "dataproc.clusters.get",
    "dataproc.clusters.getIamPolicy",
    "dataproc.clusters.setIamPolicy",
    "dataproc.clusters.update",
    "resourcemanager.projects.get",
    "resourcemanager.projects.getIamPolicy",
    "resourcemanager.projects.setIamPolicy",
    "secretmanager.secrets.getIamPolicy",
    "secretmanager.secrets.setIamPolicy"
  ]
}

# plan role
resource "google_project_iam_custom_role" "terraform_pike_plan" {
  project     = "pike-477416"
  role_id     = "terraform_pike_plan"
  title       = "terraform_pike_plan"
  description = "A user with least privileges"
  permissions = [
    "cloudkms.cryptoKeys.getIamPolicy",
    "dataproc.clusters.get",
    "dataproc.clusters.getIamPolicy",
    "resourcemanager.projects.get",
    "resourcemanager.projects.getIamPolicy",
    "secretmanager.secrets.getIamPolicy"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->
