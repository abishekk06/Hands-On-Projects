# Realtime DevOps Project with AWS

This project contains a full, real-world solution for setting up an environment that is using DevOps technologies and practices for deploying apps and cloud services/cloud infrastructure to AWS.

## Technology Details
You will be using the following technologies and platforms to set up a DevOps environment.

1. AWS
    - AWS will be used to host the application, cloud infrastructure, and any other services we may need to ensure the Uber app is deployed properly.
2. GitHub
    - To store the application and infrastructure/automation code
3. Python
    - Python will be used for the Uber app (it is written in Python) and some automation efforts that aren't in Terraform.
4. Terraform
   - Create an S3 bucket to store Terraform State files
   - Create an AWS ECR repository with Terraform
   - Create an EKS cluster
5. Docker
   - Create a Docker image
   - Store the Docker image in AWS ECR
6. Kubernetes
   - To run the Docker image that's created for the containerized Uber app. Kubernetes, in this case, EKS, will be used to orchestrate the container.
7. CI/CD
   - Use GitHub Actions to create an EKS cluster
8. Automated testing
    - Testing Terraform code with Checkov

## Prerequisites:
    
### AWS Account

### Create An AWS Account

You should have an AWS account. If you don't already have one, you can sign up for a free 12 month trial [here](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all).

### Use the AWS CLI

The AWS CLI is a way for you to interact with all AWS services at a programmatic level using the terminal.

To set this up, follow the directions [here](https://docs.aws.amazon.com/polly/latest/dg/setup-aws-cli.html)

**Installations**
You will need to download some software and services.

### **Code Editor**
You can use Visual Studio Code, which is a free code editor.

### **Terraform**

[Terraform Download](https://www.terraform.io/downloads.html)

### **Docker**
To build the Docker image, you can use Docker Desktop for Windows or MacOS.

[Docker Desktop](https://www.docker.com/products/docker-desktop)

### **Source Control**
To store the code that you'll be writing, you can create your very own GitHub account to showcase your project.

[GitHub](https://www.github.com)

## Labs:

1. AWS - Configure AWS Credentials for the user at programmatic level(SDK, CLI, Terraform, etc,.)

2. VPC - When running EKS, it requires specific networking. Because all environments will most likely be different, we can use this cloudformation template [here](https://github.com/abishekk06/Hands-On-Projects/tree/main/Project2-DevOps-Realtime/EKS-VPC-CloudFormation).

3. Terraform - The purpose of the Terraform section is to create all of the AWS cloud services we need from an environment/infrastructure perspective to run the application.
 - [create S3 to store tfstate file](https://github.com/abishekk06/Hands-On-Projects/blob/main/Project2-DevOps-Realtime/Terraform-AWS-Creation/create-s3-store-tfstate-file.md)
 - [Create an Elastic Container Registry](https://github.com/abishekk06/Hands-On-Projects/blob/main/Project2-DevOps-Realtime/Terraform-AWS-Creation/create-ecr.md)

