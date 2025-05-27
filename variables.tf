variable "enabled" {
  type        = bool
  default     = true
  description = "(Optional) Set to false to prevent the module from creating AWS Athena related resources."
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) Name (e.g. `app` or `cluster`)."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "(Optional) Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "create_s3_bucket" {
  type        = bool
  default     = true
  description = "(Optional) Conditionally create S3 bucket."
}

variable "bucket_name" {
  type        = string
  default     = "athena-bucket"
  description = "(Optional) Name of S3 bucket."
}

variable "athena_s3_bucket_id" {
  description = "(Optional) Use an existing S3 bucket for Athena query results if `create_s3_bucket` is `false`."
  type        = string
  default     = null
}

variable "bytes_scanned_cutoff_per_query" {
  description = "(Optional) Integer for the upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan. Must be at least 10485760."
  type        = number
  default     = null
}

variable "enforce_workgroup_configuration" {
  description = "(Optional) Boolean whether the settings for the workgroup override client-side settings."
  type        = bool
  default     = true
}

variable "publish_cloudwatch_metrics_enabled" {
  description = "(Optional) Boolean whether Amazon CloudWatch metrics are enabled for the workgroup."
  type        = bool
  default     = true
}

variable "s3_output_path" {
  description = "(Optional) The S3 bucket path used to store query results."
  type        = string
  default     = ""
}

variable "workgroup_force_destroy" {
  description = "(Optional) The option to delete the workgroup and its contents even if the workgroup contains any named queries."
  type        = bool
  default     = false
}

variable "databases" {
  description = "(Required) Map of Athena databases and related configuration."
  type        = map(any)
}

variable "data_catalogs" {
  description = "(Optional) Map of Athena data catalogs and related configuration."
  type        = map(any)
  default     = {}
}

variable "named_queries" {
  description = "(Optional) Map of Athena named queries and related configuration."
  type        = map(map(string))
  default     = {}
}
