resource "aws_sns_topic" "sns_topic" {
  name = "${var.project}-${var.environment}-chatbot"

  http_success_feedback_role_arn = aws_iam_role.log_role.arn
  http_failure_feedback_role_arn = aws_iam_role.log_role.arn
  http_success_feedback_sample_rate = 100
}
