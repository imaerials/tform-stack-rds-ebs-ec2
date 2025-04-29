# Terraform EC2 Web Stack

This project provisions an EC2 instance, EFS storage, and an RDS database for a web stack using Terraform. It sets up the necessary infrastructure to deploy a web server, attach EFS for storage, and configure an RDS database for data persistence.

## Features
- Provision an EC2 instance with a specified AMI and instance type.
- Set up EFS for scalable storage.
- Configure an RDS database for data management.
- Create a VPC with public and private subnets.
- Automatically configure security groups and networking.

## Usage

### Initialize Terraform
```sh
docker compose run --rm workspace terraform init
```
## Plan
```
docker compose run --rm workspace terraform plan
``` 
## Deploy
```
docker compose run --rm workspace terraform apply
``` 
## Deploy with auto approve
``` 
docker compose run --rm workspace terraform apply -auto-approve
``` 
## Targeted resource creation
``` 
docker compose run --rm workspace terraform destroy -target=module.vpc
``` 

## Terraform Console
``` 
docker compose run --rm workspace terraform console
``` 

## Output
```
docker compose run --rm workspace terraform output -json
``` 


# Ansible

``` 
docker compose run --rm workspace ansible-playbook /workspace/test.yml
``` 

# Environments

Create a .env file in root folder

```
AWS_ACCESS_KEY_ID = YourAccessKeyID
AWS_SECRET_ACCESS_KEY = yourSecretAccessKey
```