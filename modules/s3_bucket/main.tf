resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project}-${var.environment}"

  tags = {
    Project     = var.project
    Environment = var.environment
  }
}
