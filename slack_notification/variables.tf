variable "region" {
  type = string
  default = "ap-northeast-1"
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
  description = "e.g. dev/stg/prd"
}

variable "slack_workspace_id" {
  type = string
}

variable "slack_channel_id" {
  type = string
}

variable "slack_bot_token" {
  type = string
  description = "e.g. xoxb-oooo-oooo"
}
