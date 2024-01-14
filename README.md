# Sample Terraform

## initialize

```sh
$ cp .env.sample .env
# and write your settings
```

## usage

```sh
# e.g.
WORK_DIR=/work/env/stg
```

```sh
$ docker-compose run --rm -w $WORK_DIR terraform init
$ docker-compose run --rm -w $WORK_DIR terraform plan
$ docker-compose run --rm -w $WORK_DIR terraform apply
```

```sh
$ docker-compose run --rm pike scan -d $WORK_DIR
```
