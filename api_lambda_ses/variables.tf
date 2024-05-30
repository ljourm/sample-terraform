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

variable "domain" {
  type = string
  description = "e.g. example.com"
}

variable "email_from" {
  type = string
  description = "Email address to send from"
}

variable "email_to" {
  type = string
  description = "Email address to send to"
}

variable "slack_channel_id" {
  type = string
}
