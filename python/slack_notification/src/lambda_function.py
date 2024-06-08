import os
import json
import logging
from jinja2 import Template

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

    logger.info("body: %s", body)

    return {
        "statusCode": 200,
        "body": body
    }
