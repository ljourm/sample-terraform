resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name          = "${var.project}-${var.environment}-lambda-slack-notification-error"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "This metric monitors Lambda function error"
  treat_missing_data  = "notBreaching"

  dimensions = {
    FunctionName = var.function_name
  }

  alarm_actions = var.alarm_actions
}
