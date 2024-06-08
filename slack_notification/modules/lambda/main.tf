# Lambda Layer
data "archive_file" "lambda_layer" {
  type        = "zip"
  source_dir  = local.layer_source_dir
  output_path = "${local.output_dir}/layer.zip"
  excludes    = ["**/__pycache__/*"]
}

resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name       = "${var.project}-${var.environment}-slack-notification"
  filename         = data.archive_file.lambda_layer.output_path
  source_code_hash = data.archive_file.lambda_layer.output_base64sha256
}

# Lambda Function
data "archive_file" "lambda_file" {
  type        = "zip"
  source_dir  = local.function_source_dir
  output_path = "${local.output_dir}/function.zip"
  excludes    = ["pip/*", "**/__pycache__/*"]
}

resource "aws_lambda_function" "lambda_function" {
  function_name    = "${var.project}-${var.environment}-slack-notification"
  filename         = data.archive_file.lambda_file.output_path
  source_code_hash = data.archive_file.lambda_file.output_base64sha256
  runtime          = "python3.12"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  architectures    = ["arm64"]
  layers           = [aws_lambda_layer_version.lambda_layer.arn]

  reserved_concurrent_executions = 1

  environment {
    variables = {
      ENV = var.environment,
      SLACK_BOT_TOKEN = var.slack_bot_token
    }
  }
}

resource "aws_lambda_function_event_invoke_config" "lambda_config" {
  function_name          = aws_lambda_function.lambda_function.function_name
  maximum_retry_attempts = 0
}
