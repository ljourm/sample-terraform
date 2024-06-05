data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [
        "sns.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "allow_to_logs" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutMetricFilter",
      "logs:PutRetentionPolicy"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role" "log_role" {
  name = "${var.project}-${var.environment}-sns-to-chatbot"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  inline_policy {
    name   = "allow-cloudwatch-logs"
    policy = data.aws_iam_policy_document.allow_to_logs.json
  }
}
