terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "aws" {
  // regionを指定
  region = "us-east-1"
}

resource "aws_s3_bucket" "sample" {
  bucket = "sample-bucket-[your name]" // s3バケット名をユニークにするために自分の名前など入れる
  // i.e. bucket = "sample-bucket-yukinagae"
}
