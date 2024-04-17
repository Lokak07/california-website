 terraform {
  backend "s3" {
    bucket =  "my-tf-backend-s4"
    key    = "tf-scripts/logs"
    region = "us-east-1"
  }
} 