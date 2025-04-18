


# 5 buckets: raw, clean, curated, golden, docs

# resource "google_storage_bucket" "tf_rawbucket" {
#   name          = "${var.proj_name}-raw-bucket"
#   project       = var.proj_id
#   location      = var.location
#   storage_class = "COLDLINE" # STANDARD NEARLINE COLDLINE ARCHIVE
#   lifecycle_rule {
#     action {
#       type          = "SetStorageClass"
#       storage_class = "ARCHIVE"
#     }
#     condition {
#       age = 90 # Move to ARCHIVE after 90 days
#     }
#   }
#   labels = {
#     environment = var.tag_env
#     project     = var.proj_id
#     owner       = var.tag_owner
#   }
# }

# resource "google_storage_bucket" "tf_cleanbucket" {
#   name          = "${var.proj_name}-clean-bucket"
#   project       = var.proj_id
#   location      = var.location
#   storage_class = "STANDARD"
#   # logging {
#   #   log_bucket        = google_storage_bucket.tfgcplogbucket.name
#   #   log_object_prefix = "logs/"
#   # }
#   labels = {
#     environment = var.tag_env
#     project     = var.proj_id
#     owner       = var.tag_owner
#   }
# }

# resource "google_storage_bucket" "tf_curatedbucket" {
#   name          = "${var.proj_name}-curated-bucket"
#   project       = var.proj_id
#   location      = var.location
#   storage_class = "STANDARD"
#   labels = {
#     environment = var.tag_env
#     project     = var.proj_id
#     owner       = var.tag_owner
#   }
# }

# resource "google_storage_bucket" "tf_golden_bucket" {
#   name          = "${var.proj_name}-golden-bucket"
#   project       = var.proj_id
#   location      = "us-west4"
#   storage_class = "STANDARD"
#   labels = {
#     environment = var.tag_env
#     project     = var.proj_id
#     owner       = var.tag_owner
#   }
# }

resource "google_storage_bucket" "tf_docsbucket" {
  name          = "${var.proj_name}-docs-bucket"
  project       = var.proj_id
  location      = var.location
  storage_class = "STANDARD"
  labels = {
    environment = var.tag_env
    project     = var.proj_id
    owner       = var.tag_owner
  }
}
