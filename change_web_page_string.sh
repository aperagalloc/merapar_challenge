TABLE=$(cd terraform && terraform output -raw merapar_web_table_name)
REGION=$(cd terraform && terraform output -raw aws_region 2>/dev/null || echo "us-east-1")

aws dynamodb put-item \
  --table-name "$TABLE" \
  --item '{"id": {"S": "current"}, "value": {"S": "hello, string has changed!"}}' \
  --region "$REGION"