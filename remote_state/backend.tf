terraform {
  backend "s3" {
    bucket = "ljourm-test-common-bucket"
    key    = "remote_state.tfstate"
    region = "ap-northeast-1"
  }
}
