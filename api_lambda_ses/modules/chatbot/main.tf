locals {
  iam_role_name = "arn:aws:iam::303724688981:role/service-role/AWSChat-role-4"
  slack_workspace_id = "TGDF5VAG0"
}

resource "awscc_chatbot_slack_channel_configuration" "sample_chatbot_configuration" {
  configuration_name = "example-slack-channel-config"
  iam_role_arn       = local.iam_role_name
  slack_workspace_id = local.slack_workspace_id
  slack_channel_id   = var.channel_id
}
