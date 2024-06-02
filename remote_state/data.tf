data "terraform_remote_state" "secret_manager" {
  backend = "s3"

  config = {
    bucket = "ljourm-test-common-bucket"
    key    = "secret_manager.tfstate"
    region = "ap-northeast-1"
  }
}
