module "s3_bucket" {
  source = "./modules/s3_bucket"

  project     = var.project
}
