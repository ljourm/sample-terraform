locals {
  slack_workspace_id = "TGDF5VAG0"
}

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

resource "awscc_chatbot_slack_channel_configuration" "sample_chatbot_configuration" {
  configuration_name = "example-slack-channel-config"
  iam_role_arn       = aws_iam_role.chatbot_role.arn
  slack_workspace_id = local.slack_workspace_id
  slack_channel_id   = var.channel_id
}
