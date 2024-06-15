<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dkim_tokens"></a> [dkim\_tokens](#input\_dkim\_tokens) | DKIM tokens | `list(string)` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | e.g. example.com | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->