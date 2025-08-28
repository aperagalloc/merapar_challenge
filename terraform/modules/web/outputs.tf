output "web_api_base_url" {
  description = "Public base URL for the web page"
  value       = aws_apigatewayv2_api.web_api.api_endpoint
}

output "web_table_name" {
  description = "DynamoDB table name storing the current web string"
  value       = aws_dynamodb_table.web_string.name
}
