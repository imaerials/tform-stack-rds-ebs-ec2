# Terraform EC2 Web Stack

This project provisions an EC2 instance an EFS storage and a RDS database for a web stack

## Init
```
docker compose -f docker-compose.yml run --rm terraform init
``` 
## Plan
```
docker compose -f docker-compose.yml run --rm terraform plan
``` 
## Deploy
```
docker compose -f docker-compose.yml run --rm terraform apply
``` 

``` 
docker compose -f docker-compose.yml run --rm terraform apply -auto-approve
``` 

## Terraform Console
``` 
docker compose -f docker-compose.yml run --rm terraform console
``` 

## Output
```
docker compose -f docker-compose.yml run --rm terraform output -json
``` 

## Environments

Create a .env file in root folder

# DevOps Workspace

``` 
docker compose run --rm workspace terraform  plan
```

``` 
docker compose run --rm workspace ansible-playbook /workspace/test.yml
``` 