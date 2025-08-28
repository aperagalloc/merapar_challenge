resource "aws_lambda_function" "get_web_page" {
  function_name = "get_web_page"
  handler       = "web_content.lambda_handler"
  runtime       = "python3.11"
  role          = aws_iam_role.web_lambda_exec_role.arn

  filename         = data.archive_file.web_page_lambda_zip.output_path
  source_code_hash = data.archive_file.web_page_lambda_zip.output_base64sha256

  environment {
    variables = {
      TABLE_NAME    = aws_dynamodb_table.web_string.name
      DEFAULT_VALUE = "default"
    }
  }

  memory_size = var.lambda_memory_mb
  timeout     = var.lambda_timeout_seconds

  tags = {
    Project = local.app_name
  }
}

data "archive_file" "web_page_lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_fn"
  output_path = "${path.module}/build/${local.app_name}.zip"
}
