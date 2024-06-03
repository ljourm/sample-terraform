module "sample_chatbot_configuration" {
  source = "./modules/chatbot"

  project = var.project
  environment = var.environment
  workspace_id = var.slack_workspace_id
  channel_id = var.slack_channel_id
}
