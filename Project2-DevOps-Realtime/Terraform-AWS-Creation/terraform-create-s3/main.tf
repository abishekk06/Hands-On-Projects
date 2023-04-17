provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-devops-project0606"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}