output "arn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "name" {
  value = aws_s3_bucket.s3_bucket.id
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}
