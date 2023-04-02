# Terraform Block
terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}   

# Provider Block 
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "node-master" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  tags = {
    Name = "node-master"
  }
}

resource "aws_instance" "node-worker1" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  tags = {
    Name = "node-worker1"
  }
}

resource "aws_instance" "node-worker2" {
  ami           = "ami-0e742cca61fb65051"
  instance_type = "t2.micro"
  tags = {
    Name = "node-worker2"
  }
}

/*
Note:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
