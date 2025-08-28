resource "aws_apigatewayv2_api" "web_http_api" {
  name          = "${local.app_name}-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "web_api_lambda_integration" {
  api_id           = aws_apigatewayv2_api.web_http_api.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.get_web_page.arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "web_api_route" {
  api_id    = aws_apigatewayv2_api.web_http_api.id
  route_key = "GET /"
  target    = "integrations/${aws_apigatewayv2_integration.web_api_lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "web_api_stage" {
  api_id      = aws_apigatewayv2_api.web_http_api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "web_http_api_gateway_invoke" {
  statement_id  = "AllowInvokeFromHttpApi"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_web_page.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.web_http_api.execution_arn}/*/*"
}