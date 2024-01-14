module "s3_bucket_stg" {
  source = "../../modules/s3_bucket"

  project = "ljourm-test"
  environment = "stg"
}
