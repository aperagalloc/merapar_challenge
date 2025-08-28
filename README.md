# merapar_challenge

## HTML Web Page using AWS resources API Gateway + Lambda + DynamoDB

Serves: `<h1>The saved string is {string_stored_in_dynamodb_table}</h1>`  
The **URL stays the same**; update the string by editing a DynamoDB item.
Provisioned with **Terraform**.


## Configure

Ensure AWS credentials are configured issuing `aws configure` command.

## Deploy

```bash
terraform init
terraform validate #optional, validate code
terraform fmt #optional, check code formatting
terraform plan #optional, can be used to check resource changes where TF CRUD operations will be applied with the safety of not actually applying them.
terraform apply -auto-approve