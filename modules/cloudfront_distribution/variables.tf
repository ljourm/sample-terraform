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

variable "domain_name" {
  type = string
}

variable "s3_bucket_id" {
  type = string
}
