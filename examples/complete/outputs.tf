output "bucket_id" {
  description = "Created S3 bucket ID."
  value       = module.athena.bucket_id
}

output "workgroup_id" {
  description = "Created Athena workgroup ID."
  value       = module.athena.workgroup_id
}
