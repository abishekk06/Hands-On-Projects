# Create an S3 bucket to store Terraform state files

We will create an S3 bucket that will be used to store Terraform state files

## Create The Terraform Configurations

1. We can find the Terraform configuration for the S3 bucket [here](https://github.com/abishekk06/Hands-On-Projects/blob/main/Project2-DevOps-Realtime/Terraform-AWS-Creation/terraform-create-s3/main.tf). The Terraform configuration files are used to create an S3 bucket that will store your TFSTATE.

The Terraform `main.tf` will do a few things:
- Create the S3 bucket in the `ap-south-1` region
- Ensure that version enabling is set to `True`
- Utilize AES256 encryption 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply` - To create the resource