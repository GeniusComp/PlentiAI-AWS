terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "plenty_ai_data" {
  bucket = "plenty-ai-data-283224254536"

  tags = {
    Name        = "plenty-ai-data"
    Environment = "production"
    Project     = "PlentyAI"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "plenty_ai_data" {
  bucket = aws_s3_bucket.plenty_ai_data.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "plenty_ai_data" {
  bucket = aws_s3_bucket.plenty_ai_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
