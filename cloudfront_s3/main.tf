module "s3_bucket_stg" {
  source = "../modules/s3_bucket"

  project     = var.project
  environment = var.environment
}

module "cloudfront_stg" {
  source = "../modules/cloudfront_distribution"

  project      = var.project
  environment  = var.environment
  domain_name  = module.s3_bucket_stg.bucket_regional_domain_name
  s3_bucket_id = module.s3_bucket_stg.name
}

module "s3_bucket_policy_stg" {
  source = "../modules/s3_bucket_policy"

  project                     = var.project
  environment                 = var.environment
  s3_bucket_id                = module.s3_bucket_stg.name
  s3_bucket_arn               = module.s3_bucket_stg.arn
  cloudfront_distribution_arn = module.cloudfront_stg.arn
}
