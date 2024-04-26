import os
import json
import boto3
import logging
from jinja2 import Template
from botocore.exceptions import ClientError

# SESクライアントを作成
ses_client = boto3.client("ses")

# ロガーの設定
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    # リクエスト情報のログ出力
    logger.info("Received event: %s", json.dumps(event))

    # API GatewayからのPOSTリクエストボディを取得
    try:
        body = json.loads(event['body'])
        name = body.get('name', 'Guest')  # nameが無い場合はGuestを使う
    except (KeyError, json.JSONDecodeError) as e:
        logger.error("Invalid request body or missing name parameter: %s", str(e))
        return {
            'statusCode': 400,
            'body': 'Invalid request body or missing name parameter'
        }

    # 環境変数からメールアドレスを取得
    email_from = os.getenv("EMAIL_FROM")
    email_to = os.getenv("EMAIL_TO")

    # メールテンプレートを外部ファイルから読み込み
    with open("./email_template.txt", "r") as template_file:
        template_content = template_file.read()

    # Jinja2を使用してメール本文を生成
    template = Template(template_content)
    email_body = template.render(name=name)

    # メールの件名
    subject = f"Welcome, {name}!"

    # メールの送信
    try:
        response = ses_client.send_email(
            Source=email_from,
            Destination={
                'ToAddresses': [email_to],
            },
            Message={
                'Subject': {
                    'Data': subject,
                },
                'Body': {
                    'Text': {
                        'Data': email_body,
                    },
                },
            },
        )
        logger.info("Email sent successfully: %s", response)
        return {
            'statusCode': 200,
            'body': f"Email sent successfully: {response}"
        }
    except ClientError as e:
        logger.error("Failed to send email: %s", e.response['Error']['Message'])
        return {
            'statusCode': 500,
            'body': f"Failed to send email: {e.response['Error']['Message']}"
        }
