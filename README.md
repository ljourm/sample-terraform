# Sample Terraform

## initialize

```sh
$ cp .env.sample .env
# and write your settings
```

## usage

### Set WORK_DIR

```sh
WORK_DIR=/work/api_lambda_ses
WORK_DIR=/work/cloudfront_s3
WORK_DIR=/work/common_bucket
WORK_DIR=/work/remote_state
WORK_DIR=/work/secret_manager
WORK_DIR=/work/slack_notification
```

### Terraform

```sh
$ docker-compose run --rm -w $WORK_DIR terraform init -backend-config env/stg/backend.tfbackend -reconfigure
$ docker-compose run --rm -w $WORK_DIR terraform plan -var-file env/stg/main.tfvars
$ docker-compose run --rm -w $WORK_DIR terraform apply -var-file env/stg/main.tfvars
```

```sh
$ docker-compose run --rm pike scan -d $WORK_DIR
```

```sh
$ docker-compose run --rm tflint --recursive
```

### Lambda pip

```sh
$ docker-compose run --rm -w /work python sh ./lambda_pip.sh
```

### Terraform Docs

```sh
$ docker-compose run --rm -w $WORK_DIR docs -c ../.terraform-docs.yml markdown .
```
