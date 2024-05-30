terraform {
  backend "s3" {
    bucket = "ljourm-test-common-bucket"
    key    = "common_bucket.tfstate"
    region = "ap-northeast-1"
  }
}
