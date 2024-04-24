module "s3_bucket" {
  source = "../modules/s3_bucket"

  project     = var.project
  environment = var.environment
}

module "cloudfront" {
  source = "../modules/cloudfront_distribution"

  domain_name  = module.s3_bucket.bucket_regional_domain_name
  s3_bucket_id = module.s3_bucket.name
}

module "s3_bucket_policy" {
  source = "../modules/s3_bucket_policy"

  s3_bucket_id                = module.s3_bucket.name
  s3_bucket_arn               = module.s3_bucket.arn
  cloudfront_distribution_arn = module.cloudfront.arn
}
