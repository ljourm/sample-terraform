resource "aws_secretsmanager_secret" "secret" {
  name = "${var.project}-${var.environment}-secret"
}

resource "aws_secretsmanager_secret_version" "version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(local.secrets)

  lifecycle {
    ignore_changes = [
      secret_string
    ]
  }
}
