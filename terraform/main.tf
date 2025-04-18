locals {
  proj_name    = "dynamic-run-portfolio"
  proj_id      = "dynamic-run-portfolio1"
  location     = "us-central1"
  zone         = "us-central1-b"
  machine_type = "n1-standard-4"
  release      = "1"
  tag_owner    = "guilhermeviegas"
  tag_env      = "prod"
}

provider "google-beta" {
  project     = local.proj_id
  region      = local.location
  credentials = file("./dynamic-run-portfolio1-sa-credential.json")
}

module "network" {
  source    = "./modules/network"
  proj_name = local.proj_name
  proj_id   = local.proj_id
  location  = local.location
  # zone      = local.zone
  tag_owner = local.tag_owner
}

module "datalake" {
  source    = "./modules/datalake"
  proj_name = local.proj_name
  proj_id   = local.proj_id
  location  = "US" # NOT local.location
  tag_owner = local.tag_owner
  tag_env   = local.tag_env
}

# module "datawarehouse" {
#   source      = "./modules/datawarehouse"
#   proj_name   = local.proj_name
#   proj_id     = local.proj_id
#   location    = local.location
#   # bucket_name = local.bucket_name
# }

module "compute" {
  source              = "./modules/compute"
#   proj_name           = local.proj_name
  proj_id             = local.proj_id
  location            = local.location
#   zone                = local.zone
#   machine_type        = local.machine_type
#   tag_owner           = local.tag_owner
#   network_name        = module.network.vpc_network_name
#   cleanbucket_name    = module.datalake.cleanbucket_name
#   curatedbucket_name  = module.datalake.curatedbucket_name
}

module "searchengine" {
  source      = "./modules/searchengine"
  proj_name   = local.proj_name
  proj_id     = local.proj_id
  location    = local.location
  # zone        = local.zone
  release     = local.release
  # tag_env   = local.tag_env
}

