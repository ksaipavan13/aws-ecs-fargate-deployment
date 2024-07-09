AWS ECS Fargate Deployment with ReactJS and Strapi

This document provides a step-by-step guide to set up, build, and deploy a ReactJS frontend and Strapi backend using AWS ECS Fargate, optimized for a MacBook Pro with an M1 chip.

Prerequisites

Ensure you have the following installed and configured:

AWS CLI: For interacting with AWS services.
Docker: For containerizing applications.
Terraform: For infrastructure as code.
Node.js: Ensure compatibility with M1 chip, preferably use Node.js version 16 or above.
aws-ecs-fargate-deployment/
Repository Structure
│
├── reactjs/
│   ├── Dockerfile
│   ├── README.md
│   ├── package-lock.json
│   ├── package.json
│   ├── public/
│   └── src/
│
├── strapi/
│   ├── Dockerfile
│   ├── README.md
│   ├── config/
│   ├── database/
│   ├── node_modules/
│   ├── public/
│   ├── src/
│   ├── types/
│   ├── yarn.lock
│   └── uploads/
│
└── terraform/
    ├── main.tf
    ├── outputs.tf
    ├── variables.tf
    ├── terraform.tfstate
    └── terraform.tfstate.backup
    Steps

1. Cloning the Repository
First, clone the repository to your local machine.


git clone https://github.com/ksaipavan13/aws-ecs-fargate-deployment.git
cd aws-ecs-fargate-deployment
2. Docker Setup for ReactJS
Navigate to the reactjs directory.


cd reactjs
Building the Docker Image

Build the Docker image using Docker Buildx to support multiple platforms.


docker buildx build --platform linux/amd64,linux/arm64 -t reactjs-ui:latest .
Pushing to AWS ECR

Tag and push the Docker image to AWS Elastic Container Registry (ECR).


docker tag reactjs-ui:latest 533266978173.dkr.ecr.ca-central-1.amazonaws.com/reactjs:latest
docker push 533266978173.dkr.ecr.ca-central-1.amazonaws.com/reactjs:latest
3. Docker Setup for Strapi
Navigate to the strapi directory.


cd ../strapi
Building the Docker Image

Build the Docker image using Docker Buildx to support multiple platforms.


docker buildx build --platform linux/amd64,linux/arm64 -t strapi-api:latest .
Pushing to AWS ECR

Tag and push the Docker image to AWS Elastic Container Registry (ECR).


docker tag strapi-api:latest 533266978173.dkr.ecr.ca-central-1.amazonaws.com/strapi:latest
docker push 533266978173.dkr.ecr.ca-central-1.amazonaws.com/strapi:latest
4. Terraform Setup
Navigate to the terraform directory.


cd ../terraform
Initializing Terraform

Initialize Terraform to set up the backend and provider configurations.

terraform init
Applying Terraform Configuration

Apply the Terraform configuration to provision the necessary AWS resources.

terraform apply
Confirm the action by typing yes when prompted.
5. Route53 Configuration
Configure the DNS settings for ReactJS and Strapi.
Record name: saipavan.contentecho.in
Record type: A
Value: <Public IP of ReactJS service>
Alias: No
TTL (seconds): 300
Routing policy: Simple

Record name: saipavan-api.contentecho.in
Record type: A
Value: <Public IP of Strapi service>
Alias: No
TTL (seconds): 300
Routing policy: Simple
6. Verify Deployment
Check the status of the ECS services and tasks using the AWS CLI.

aws ecs list-services --cluster ecs-cluster
aws ecs list-tasks --cluster ecs-cluster
7. Accessing the Applications
Open a web browser and navigate to the configured domain names for both ReactJS and Strapi to verify they are running correctly.

http://saipavan.contentecho.in
http://saipavan-api.contentecho.in
Conclusion

Following these steps, you have successfully set up, built, and deployed a ReactJS frontend and Strapi backend using AWS ECS Fargate. This setup is optimized for a MacBook Pro with an M1 chip, ensuring compatibility and efficient performance.
