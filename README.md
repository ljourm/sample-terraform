# Sample Terraform

## initialize

```sh
$ cp .env.sample .env
# and write your settings
```

## usage

```sh
# e.g.
WORK_DIR=/work/cloudfront_s3
```

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

### lambda pip

```sh
$ docker-compose run --rm -w /work python sh ./lambda_pip.sh
```
