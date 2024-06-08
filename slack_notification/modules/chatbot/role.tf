# chatbot role
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [
        "chatbot.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "allow_for_chatbot" {
  statement {
    actions = [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    actions = [
      "logs:Describe*",
      "logs:Get*",
      "logs:List*",
      "logs:StartQuery",
      "logs:StopQuery",
      "logs:TestMetricFilter",
      "logs:FilterLogEvents"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role" "chatbot_role" {
  name = "${var.project}-${var.environment}-chatbot"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "chatbot_role_policy" {
  name = "allow_for_chatbot"
  role = aws_iam_role.chatbot_role.name
  policy = data.aws_iam_policy_document.allow_for_chatbot.json
}

# guardrail policy
data "aws_iam_policy_document" "guardrail_policy" {
  statement {
    actions = [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    actions = [
      "logs:Describe*",
      "logs:Get*",
      "logs:List*",
      "logs:StartQuery",
      "logs:StopQuery",
      "logs:TestMetricFilter",
      "logs:FilterLogEvents"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "guardrail_policy" {
  name        = "${var.project}-${var.environment}-guardrail-policy"
  description = "Guardrail policy for chatbot"
  policy      = data.aws_iam_policy_document.guardrail_policy.json
}
