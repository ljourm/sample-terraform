<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.secret_manager](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | e.g. dev/stg/prd | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_remote_state"></a> [remote\_state](#output\_remote\_state) | n/a |
<!-- END_TF_DOCS -->