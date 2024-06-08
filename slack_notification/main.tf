module "sns" {
  source = "./modules/sns"

  project = var.project
  environment = var.environment
}

module "chatbot" {
  source = "./modules/chatbot"

  project = var.project
  environment = var.environment
  workspace_id = var.slack_workspace_id
  channel_id = var.slack_channel_id
  sns_topic_arns = [module.sns.arn]
}

module "lambda" {
  source = "./modules/lambda"

  project = var.project
  environment = var.environment
}
