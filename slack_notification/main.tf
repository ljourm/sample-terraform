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

module "cloudwatch_alarm" {
  source = "./modules/cloudwatch_alarm"

  project = var.project
  environment = var.environment
  function_name = module.lambda.function_name
  alarm_actions = [module.sns.arn]
}
