variable "project" {
  type = string
}

variable "environment" {
  type = string
  description = "e.g. dev/stg/prd"
}

variable "workspace_id" {
  type = string
}

variable "channel_id" {
  type = string
}

variable "sns_topic_arns" {
  type = list(string)
}
