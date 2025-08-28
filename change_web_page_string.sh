TABLE=$(terraform output -raw table_name)
REGION=$(terraform output -raw region 2>/dev/null || echo "us-east-1")

aws dynamodb put-item \
  --table-name "$TABLE" \
  --item '{"id": {"S": "current"}, "value": {"S": "👋 hello, interview!"}}' \
  --region "$REGION"