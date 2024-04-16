

resource "aws_s3_bucket" "my-tf-backend-s3" {
  bucket = "my-tf-backend-s3"
  force_destroy = true

  tags = {
    Name        = "My-terraform-backend-s3"
    Environment = "Dev"
  }
  
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = "my-tf-backend-s3"
  versioning_configuration {
    status = "Enabled"
  }
}