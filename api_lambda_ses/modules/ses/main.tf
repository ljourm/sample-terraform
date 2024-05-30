resource "aws_sesv2_email_identity" "ses" {
  email_identity = var.domain
}

resource "aws_sesv2_configuration_set" "configuration_set" {
  configuration_set_name = replace("${var.domain}-configuration-set", ".", "-")
  suppression_options {
    suppressed_reasons = ["BOUNCE", "COMPLAINT"]
  }
}

resource "aws_sesv2_email_identity_mail_from_attributes" "mail_from" {
  email_identity   = var.domain
  mail_from_domain = "aws-ses.${var.domain}"
}
