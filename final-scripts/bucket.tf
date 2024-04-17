

resource "aws_s3_bucket" "my-tf-backend-s6" {
  bucket = "my-tf-backend-s6"
  force_destroy = true

  tags = {
    Name        = "My-terraform-backend-s6"
    Environment = "Dev"
  }
  
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = "my-tf-backend-s6"
  versioning_configuration {
    status = "Enabled"
  }
} 
