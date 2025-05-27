# Output definitions for Athena resources

# S3 bucket outputs
output "bucket_id" {
  description = "ID of the S3 bucket used by Athena."
  value       = try(aws_s3_bucket.this[0].id, null)
}

output "bucket_arn" {
  description = "ARN of the S3 bucket used by Athena."
  value       = try(aws_s3_bucket.this[0].arn, null)
}

# Athena workgroup output
output "workgroup_id" {
  description = "ID of the newly created Athena workgroup."
  value       = try(aws_athena_workgroup.default[0].id, null)
}

# Athena database output
output "databases" {
  description = "List of newly created Athena databases."
  value       = aws_athena_database.default
}

# Athena data catalog output
output "data_catalogs" {
  description = "List of newly created Athena data catalogs."
  value       = aws_athena_data_catalog.default
}

# Athena named query output
output "named_queries" {
  description = "List of newly created Athena named queries."
  value       = aws_athena_named_query.default
}
