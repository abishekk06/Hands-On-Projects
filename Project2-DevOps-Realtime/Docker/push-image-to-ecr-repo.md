# Push Image To ECR

The ECR repo will be where we store the Docker image that we created on your local computer.

## Log Into The ECR Repository
1. Terraform Code
2. Log in to ECR with AWS CLI
`aws ecr get-login-password --region *your_aws_region* | docker login --username AWS --password-stdin *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com`


## Tag The Docker image
1. Tag the Docker image
`docker tag myapp *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com`

## Push The Docker Image To ECR
1. Push the Docker image to ECR
`docker push *your_aws_account_id*.dkr.ecr.ap-south-1.amazonaws.com/*repo_name*`
