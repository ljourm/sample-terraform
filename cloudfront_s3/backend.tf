terraform {
  backend "s3" {
    bucket = "ljourm-test-common-bucket"
    key    = "cloudfront_s3.tfstate"
    region = "ap-northeast-1"
  }
}
