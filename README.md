# Terraform EC2 Web Stack

This project provisions an EC2 instance to be used as a web server using Terraform. An RDS instance also is provided

## Init
```
docker compose -f docker-compose.yml run --rm terraform init
``` 
## Plan
```
docker compose -f docker-compose.yml run --rm terraform plan
``` 
## Deply
```
docker compose -f docker-compose.yml run --rm terraform apply
``` 


## Output
```
docker compose -f docker-compose.yml run --rm terraform output -json
``` 

## Environments

Create a .ENV file in root folder