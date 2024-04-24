module "sample_ses" {
  source = "../modules/ses"

  domain = var.domain
}

module "sample_ses_for_route53" {
  source = "../modules/route53_for_ses"

  domain = var.domain
  dkim_tokens = module.sample_ses.dkim_tokens
}
