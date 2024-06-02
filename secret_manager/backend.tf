terraform {
  backend "s3" {
    bucket = "ljourm-test-common-bucket"
    region = "ap-northeast-1"
  }
}
