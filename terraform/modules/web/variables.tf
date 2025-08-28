variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "resources_prefix" {
  description = "Name/prefix for all resources"
  type        = string
  default     = "web_demo"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name to store the current string"
  type        = string
  default     = "web_page_string"
}

variable "lambda_memory_mb" {
  description = "Lambda memory size (MB)"
  type        = number
  default     = 256
}

variable "lambda_timeout_seconds" {
  description = "Lambda timeout in seconds"
  type        = number
  default     = 3
}
