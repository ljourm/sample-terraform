variable "project" {
  type = string
}

variable "environment" {
  type = string
  description = "e.g. dev/stg/prd"
}

variable "function_name" {
  type = string
}

variable "alarm_actions" {
  type = list(string)
}
