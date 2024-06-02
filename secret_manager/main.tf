module "secret_manager" {
  source = "./modules/secret_manager"
  project = var.project
  environment = var.environment
}
