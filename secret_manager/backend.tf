terraform {
  backend "s3" {
    bucket = "ljourm-test-common-bucket"
    key    = "secret_manager.tfstate"
    region = "ap-northeast-1"
  }
}
