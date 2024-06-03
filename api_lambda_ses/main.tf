data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.terraform_remote_state.remote_state.outputs.remote_state.secret_manager.id
}

locals {
  credentials = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)
}

module "sample_ses" {
  source = "./modules/ses"

  domain = var.domain
}

module "sample_ses_for_route53" {
  source = "./modules/route53_for_ses"

  domain = var.domain
  dkim_tokens = module.sample_ses.dkim_tokens
}

module "samle_lambda" {
  source = "./modules/lambda"

  project = var.project
  environment = var.environment
  email_from = local.credentials["ses_from_address"]
  email_to = local.credentials["ses_to_address"]
}
