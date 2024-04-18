

resource "aws_s3_bucket" "my-tf-backend-eks" {
  bucket = "my-tf-backend-eks"
  force_destroy = true

  tags = {
    Name        = "My-terraform-backend-eks"
    Environment = "Dev"
  }
  
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = "my-tf-backend-eks"
  versioning_configuration {
    status = "Enabled"
  }
} 
