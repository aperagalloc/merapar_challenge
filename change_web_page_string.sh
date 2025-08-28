#!/usr/bin/env bash
set -euo pipefail

NEW_VALUE="${1:-hello, string has changed!}"

TABLE=$(cd terraform && terraform output -raw merapar_web_table_name)
REGION=$(cd terraform && terraform output -raw aws_region 2>/dev/null || echo "us-east-1")

aws dynamodb put-item \
  --table-name "$TABLE" \
  --item "{\"id\": {\"S\": \"current\"}, \"value\": {\"S\": \"${NEW_VALUE}\"}}" \
  --region "$REGION"