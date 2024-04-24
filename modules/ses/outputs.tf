output "dkim_tokens" {
  value = aws_sesv2_email_identity.ses.dkim_signing_attributes[0].tokens
}
