terraform {
  backend "s3" {
    bucket = "terraform-devops-project0606"
    key    = "ecr-terraform.tfstate"
    region = "ap-south-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_ecr_repository" "abishekk0606-ecr" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}