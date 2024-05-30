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
  email_from = var.email_from
  email_to = var.email_to
}
