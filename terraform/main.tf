module "merapar_challenge_web_page" {
  source                 = "./modules/web"
  aws_region             = var.aws_region
  resources_prefix       = var.resources_prefix #project-resources prefix
  dynamodb_table_name    = var.dynamodb_table_name
  lambda_memory_mb       = var.lambda_memory_mb
  lambda_timeout_seconds = var.lambda_timeout_seconds
}
