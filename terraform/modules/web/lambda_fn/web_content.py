import os
import boto3
import json

TABLE_NAME = os.environ.get("TABLE_NAME")
DEFAULT_VALUE = os.environ.get("DEFAULT_VALUE", "default")

dynamodb = boto3.client('dynamodb')

def lambda_handler(event, context):
    try:
        resp = dynamodb.get_item(
            TableName=TABLE_NAME,
            Key={"id": {"S": "current"}},
            ConsistentRead=True
        )
        if "Item" in resp and "value" in resp["Item"]:
            value = resp["Item"]["value"]["S"]
        else:
            value = DEFAULT_VALUE
    except Exception as e:
        value = DEFAULT_VALUE

    html_content = f"<h1>The saved string is {value}</h1>"
    
    return {
        'statusCode': 200,
        'headers': {'Content-Type': 'text/html'},
        'body': html_content
    }
