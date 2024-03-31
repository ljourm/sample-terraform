module "s3_bucket_stg" {
  source = "../../modules/s3_bucket"

  project = "ljourm-test"
  environment = "stg"
}

module "cloudfront_stg" {
  source = "../../modules/cloudfront_distribution"

  project      = "ljourm-test"
  environment  = "stg"
  domain_name  = module.s3_bucket_stg.bucket_regional_domain_name
  s3_bucket_id = module.s3_bucket_stg.name
}

module "s3_bucket_policy_stg" {
  source = "../../modules/s3_bucket_policy"

  project                     = "ljourm-test"
  environment                 = "stg"
  s3_bucket_id                = module.s3_bucket_stg.name
  s3_bucket_arn               = module.s3_bucket_stg.arn
  cloudfront_distribution_arn = module.cloudfront_stg.arn
}
