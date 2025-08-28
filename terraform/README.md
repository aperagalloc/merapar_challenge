<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.13.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | ~> 2.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_merapar_challenge_web_page"></a> [merapar\_challenge\_web\_page](#module\_merapar\_challenge\_web\_page) | ./modules/web | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | DynamoDB table name to store the current string | `string` | n/a | yes |
| <a name="input_lambda_memory_mb"></a> [lambda\_memory\_mb](#input\_lambda\_memory\_mb) | Lambda memory size (MB) | `number` | n/a | yes |
| <a name="input_lambda_timeout_seconds"></a> [lambda\_timeout\_seconds](#input\_lambda\_timeout\_seconds) | Lambda timeout in seconds | `number` | n/a | yes |
| <a name="input_resources_prefix"></a> [resources\_prefix](#input\_resources\_prefix) | Name/prefix for all resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_merapar_api_base_url"></a> [merapar\_api\_base\_url](#output\_merapar\_api\_base\_url) | Public base URL for the web page |
| <a name="output_merapar_web_table_name"></a> [merapar\_web\_table\_name](#output\_merapar\_web\_table\_name) | DynamoDB table name storing the current web string |
<!-- END_TF_DOCS -->