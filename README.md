<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_athena_data_catalog.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_data_catalog) | resource |
| [aws_athena_database.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_database) | resource |
| [aws_athena_named_query.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_named_query) | resource |
| [aws_athena_workgroup.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_workgroup) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_athena_s3_bucket_id"></a> [athena\_s3\_bucket\_id](#input\_athena\_s3\_bucket\_id) | (Optional) Use an existing S3 bucket for Athena query results if `create_s3_bucket` is `false`. | `string` | `null` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | (Optional) Name of S3 bucket. | `string` | `"athena-bucket"` | no |
| <a name="input_bytes_scanned_cutoff_per_query"></a> [bytes\_scanned\_cutoff\_per\_query](#input\_bytes\_scanned\_cutoff\_per\_query) | (Optional) Integer for the upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan. Must be at least 10485760. | `number` | `null` | no |
| <a name="input_create_s3_bucket"></a> [create\_s3\_bucket](#input\_create\_s3\_bucket) | (Optional) Conditionally create S3 bucket. | `bool` | `true` | no |
| <a name="input_data_catalogs"></a> [data\_catalogs](#input\_data\_catalogs) | (Optional) Map of Athena data catalogs and related configuration. | `map(any)` | `{}` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | (Required) Map of Athena databases and related configuration. | `map(any)` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Optional) Set to false to prevent the module from creating AWS Athena related resources. | `bool` | `true` | no |
| <a name="input_enforce_workgroup_configuration"></a> [enforce\_workgroup\_configuration](#input\_enforce\_workgroup\_configuration) | (Optional) Boolean whether the settings for the workgroup override client-side settings. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_named_queries"></a> [named\_queries](#input\_named\_queries) | (Optional) Map of Athena named queries and related configuration. | `map(map(string))` | `{}` | no |
| <a name="input_publish_cloudwatch_metrics_enabled"></a> [publish\_cloudwatch\_metrics\_enabled](#input\_publish\_cloudwatch\_metrics\_enabled) | (Optional) Boolean whether Amazon CloudWatch metrics are enabled for the workgroup. | `bool` | `true` | no |
| <a name="input_s3_output_path"></a> [s3\_output\_path](#input\_s3\_output\_path) | (Optional) The S3 bucket path used to store query results. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(any)` | `{}` | no |
| <a name="input_workgroup_force_destroy"></a> [workgroup\_force\_destroy](#input\_workgroup\_force\_destroy) | (Optional) The option to delete the workgroup and its contents even if the workgroup contains any named queries. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the S3 bucket used by Athena. |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of the S3 bucket used by Athena. |
| <a name="output_data_catalogs"></a> [data\_catalogs](#output\_data\_catalogs) | List of newly created Athena data catalogs. |
| <a name="output_databases"></a> [databases](#output\_databases) | List of newly created Athena databases. |
| <a name="output_named_queries"></a> [named\_queries](#output\_named\_queries) | List of newly created Athena named queries. |
| <a name="output_workgroup_id"></a> [workgroup\_id](#output\_workgroup\_id) | ID of the newly created Athena workgroup. |
<!-- END_TF_DOCS -->