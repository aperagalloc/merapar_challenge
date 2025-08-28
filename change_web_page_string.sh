TABLE=$(terraform output -raw merapar_api_base_url)
REGION=$(terraform output -raw aws_region 2>/dev/null || echo "us-east-1")

aws dynamodb put-item \
  --table-name "$TABLE" \
  --item '{"id": {"S": "current"}, "value": {"S": "hello, string has changed!"}}' \
  --region "$REGION"