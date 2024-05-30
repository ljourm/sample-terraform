variable "project" {
  type = string
}

variable "environment" {
  type = string
  description = "e.g. dev/stg/prd"
}

variable "email_from" {
  type = string
  description = "Email address to send from"
}

variable "email_to" {
  type = string
  description = "Email address to send to"
}
