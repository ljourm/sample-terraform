resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project}-common-bucket"
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
