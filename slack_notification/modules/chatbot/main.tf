resource "awscc_chatbot_slack_channel_configuration" "chatbot_configuration" {
  configuration_name = "${var.project}-${var.environment}-chatbot"
  iam_role_arn       = aws_iam_role.chatbot_role.arn
  slack_workspace_id = var.workspace_id
  slack_channel_id   = var.channel_id
  logging_level      = "INFO"
  guardrail_policies = [
    aws_iam_policy.guardrail_policy.arn
  ]
}
