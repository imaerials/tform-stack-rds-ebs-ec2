# Terraform EC2 Web Stack

This project provisions an EC2 instance an EFS storage and a RDS database for a web stack

## Init
```
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
