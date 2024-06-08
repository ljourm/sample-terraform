import os
import json
import logging
from jinja2 import Template
from slack_sdk import WebClient
from slack_sdk.errors import SlackApiError

# ロガーの設定
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    # リクエスト情報のログ出力
    logger.info("Received event: %s", json.dumps(event))
    logger.info("Received context: %s", json.dumps(context, default=str))

    env = os.getenv("ENV")

    # テンプレートを外部ファイルから読み込み
    with open("./templates/sample.txt.j2", "r") as template_file:
        template_content = template_file.read()

    # Jinja2を使用して本文を生成
    template = Template(template_content)
    body = template.render(name='sample')

    client = WebClient(token=os.environ['SLACK_BOT_TOKEN'])

    try:
        response = client.chat_postMessage(channel='#aws-notification', text=body)

        logger.info(f"Message sent successfully: {response}")

        return {
            "statusCode": 200,
            "body": body
        }
    except SlackApiError as e:
        logger.error(f"Received an error: {e}")
