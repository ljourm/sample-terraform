WORK_DIR=/work/api_lambda_ses/modules/lambda

cd $WORK_DIR

pip install -r ./src/requirements.txt -t ./pip/python
find ./pip/python -type f | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm

# ----

WORK_DIR=/work/python/slack_notification

cd $WORK_DIR

pip install -r ./requirements.txt -t ./pip/python
find ./pip/python -type f | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm
