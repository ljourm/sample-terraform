locals {
  layer_source_dir    = "${path.module}/../../../python/slack_notification/pip"
  function_source_dir = "${path.module}/../../../python/slack_notification/src"
  output_dir          = "${path.module}/../../../python/slack_notification/dist"
}
