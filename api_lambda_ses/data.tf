data "terraform_remote_state" "remote_state" {
  backend = "s3"

  config = {
    bucket = "ljourm-test-common-bucket"
    key    = "${var.environment}/remote_state.tfstate"
    region = "ap-northeast-1"
  }
}
