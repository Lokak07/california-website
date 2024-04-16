 terraform {
  backend "s3" {
    bucket =  "my-tf-backend-s3"
    key    = "tf-scripts/logs"
    region = "us-east-1"
  }
} 