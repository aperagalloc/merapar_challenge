# merapar_challenge

## HTML Web Page using AWS resources API Gateway + Lambda + DynamoDB

### Serves: `<h1>The saved string is {string_stored_in_dynamodb_table}</h1>`  
### The **URL stays the same**; update the string by editing a DynamoDB item.
### Provisioned with **Terraform**.

## Configure

Ensure AWS credentials are configured issuing `aws configure` command or export the required credentials:

```bash
export AWS_ACCESS_KEY_ID=AKIAxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxx
export AWS_DEFAULT_REGION=us-east-1
```

## Terraform state config pre-steps

If the tfstate is going to be saved into an S3 bucket location, then run the following bash script to create it:

```bash
./create_tf_state_required_resources
```

## Deploy

Run the following: (ommit optional steps if not required)

```bash
terraform init
terraform validate #optional, validate code
terraform fmt #optional, check code formatting
terraform plan -var-file=./env/test.tfvars -out tfplan
terraform apply tfplan
```

## Change Web Page contents without deploying again with Terraform

In order to do this, the web page string content which gets pulled from DynamoDB needs to be changed using this bash script:

```bash
./change_web_page_string.sh
```

The specific string to be changed needs to be manually provided by modifiying the script on line 6:

```bash
   --item '{"id": {"S": "current"}, "value": {"S": "hello, string has changed!"}}' \
```