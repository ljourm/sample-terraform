# ---- IAM ----
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.project}-${var.environment}-lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "lambda_role_attachement" {
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "lambda_inline_policy" {
  name = "${var.project}-${var.environment}-lambda-policy"
  role = aws_iam_role.lambda_role.name
  policy = file("${path.module}/iam_policy.json")
}

# ---- Lambda layer ----
data "archive_file" "lambda_layer" {
  type        = "zip"
  source_dir  = "${path.module}/pip"
  output_path = "${path.module}/dist/layer.zip"
}

resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name       = "${var.project}-${var.environment}-lambda"
  filename         = data.archive_file.lambda_layer.output_path
  source_code_hash = data.archive_file.lambda_layer.output_base64sha256
}

# ---- Lambda function ----
data "archive_file" "lambda_file" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/dist/function.zip"
}

resource "aws_lambda_function" "lambda_function" {
  function_name    = "${var.project}-${var.environment}-lambda"
  filename         = data.archive_file.lambda_file.output_path
  source_code_hash = data.archive_file.lambda_file.output_base64sha256
  runtime          = "python3.12"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  architectures    = ["arm64"]

  layers = [
    "${aws_lambda_layer_version.lambda_layer.arn}"
  ]

  environment {
    variables = {
      ENV        = var.environment,
      EMAIL_FROM = var.email_from,
      EMAIL_TO   = var.email_to
    }
  }
}
