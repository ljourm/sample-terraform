WORK_DIR=/work/modules/lambda

cd $WORK_DIR

pip install -r ./src/requirements.txt -t ./pip/python
find ./pip/python -type f | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm
