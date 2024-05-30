terraform {
  backend "s3" {
    bucket = "ljourm-test-common-bucket"
    key    = "api_lambda_ses.tfstate"
    region = "ap-northeast-1"
  }
}
