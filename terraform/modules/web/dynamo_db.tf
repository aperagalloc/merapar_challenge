resource "aws_dynamodb_table" "web_string" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Project = local.app_name
  }
}

resource "aws_dynamodb_table_item" "web_string_initial_value" {
  table_name = aws_dynamodb_table.web_string.name
  hash_key   = aws_dynamodb_table.web_string.hash_key

  item = jsonencode({
    id    = { S = "current" }
    value = { S = "initial_value" }
  })
}
