output "merapar_api_base_url" {
  description = "Public base URL for the web page"
  value       = module.merapar_challenge_web_page.web_api_base_url
}

output "merapar_web_table_name" {
  description = "DynamoDB table name storing the current web string"
  value       = module.merapar_challenge_web_page.web_table_name
}
