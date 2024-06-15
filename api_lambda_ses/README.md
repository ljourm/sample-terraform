<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.32 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.46.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_samle_lambda"></a> [samle\_lambda](#module\_samle\_lambda) | ./modules/lambda | n/a |
| <a name="module_sample_ses"></a> [sample\_ses](#module\_sample\_ses) | ./modules/ses | n/a |
| <a name="module_sample_ses_for_route53"></a> [sample\_ses\_for\_route53](#module\_sample\_ses\_for\_route53) | ./modules/route53_for_ses | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret_version.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [terraform_remote_state.remote_state](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | e.g. example.com | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | e.g. dev/stg/prd | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"ap-northeast-1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->