variable "domain" {
  type = string
  description = "e.g. example.com"
}

variable "dkim_tokens" {
  type = list(string)
  description = "DKIM tokens"
}
