# Lambda
data "aws_iam_policy_document" "web_lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "web_lambda_exec_role" {
  name               = "${local.resources_prefix}-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.web_lambda_assume_role.json
}

resource "aws_iam_role_policy_attachment" "web_lambda_basic_logs" {
  role       = aws_iam_role.web_lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


# DynamoDB
data "aws_iam_policy_document" "web_string_dynamodb_read" {
  statement {
    actions = [
      "dynamodb:GetItem"
    ]
    resources = [aws_dynamodb_table.web_string.arn]
  }
}

resource "aws_iam_policy" "web_dynamodb_read" {
  name   = "${local.resources_prefix}-dynamodb-read"
  policy = data.aws_iam_policy_document.web_string_dynamodb_read.json
}

resource "aws_iam_role_policy_attachment" "web_dynamodb_read_attachment" {
  role       = aws_iam_role.web_lambda_exec_role.name
  policy_arn = aws_iam_policy.web_dynamodb_read.arn
}
