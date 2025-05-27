# Define local variables for S3 bucket configuration

locals {
  # Set the S3 bucket ID based on whether a new bucket is created or an existing one is used
  s3_bucket_id = var.create_s3_bucket ? try(aws_s3_bucket.this[0].id, null) : var.athena_s3_bucket_id

  # Set the S3 bucket name, using a custom name if provided, or falling back to the 'name' variable
  s3_bucket_name = var.create_s3_bucket && var.bucket_name != "" ? var.bucket_name : var.name
}
