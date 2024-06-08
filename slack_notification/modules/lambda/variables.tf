variable "project" {
  type = string
}

variable "environment" {
  type = string
  description = "e.g. dev/stg/prd"
}

variable "slack_bot_token" {
  type = string
  description = "e.g. xoxb-oooo-oooo"
}
