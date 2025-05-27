# S3 bucket configuration
# Creates an S3 bucket if enabled and create_s3_bucket is true
# Sets up server-side encryption and applies tags
resource "aws_s3_bucket" "this" {
  count  = var.enabled && var.create_s3_bucket ? 1 : 0
  bucket = local.s3_bucket_name
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = var.tags
}

# Blocks public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "this" {
  count                   = var.enabled && var.create_s3_bucket ? 1 : 0
  bucket                  = aws_s3_bucket.this[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Sets object ownership control for the S3 bucket
resource "aws_s3_bucket_ownership_controls" "this" {
  count  = var.enabled && var.create_s3_bucket ? 1 : 0
  bucket = aws_s3_bucket.this[0].id
  rule {
    object_ownership = "ObjectWriter"
  }
}

# Athena workgroup configuration
# Creates an Athena workgroup if enabled
resource "aws_athena_workgroup" "default" {
  count = var.enabled ? 1 : 0
  name  = var.name
  configuration {
    bytes_scanned_cutoff_per_query     = var.bytes_scanned_cutoff_per_query
    enforce_workgroup_configuration    = var.enforce_workgroup_configuration
    publish_cloudwatch_metrics_enabled = var.publish_cloudwatch_metrics_enabled

    result_configuration {
      output_location = format("s3://%s/%s", local.s3_bucket_id, var.s3_output_path)
    }
  }

  force_destroy = var.workgroup_force_destroy
  tags          = var.tags
}

# Athena database configuration
# Creates Athena databases based on the provided map
resource "aws_athena_database" "default" {
  for_each   = var.enabled ? var.databases : {}
  name       = each.key
  bucket     = local.s3_bucket_id
  comment    = try(each.value.comment, null)
  properties = try(each.value.properties, null)

  dynamic "acl_configuration" {
    for_each = try(each.value.acl_configuration, null) != null ? ["true"] : []
    content {
      s3_acl_option = each.value.acl_configuration.s3_acl_option
    }
  }

  expected_bucket_owner = try(each.value.expected_bucket_owner, null)
  force_destroy         = try(each.value.force_destroy, false)
}

# Athena data catalog configuration
# Creates Athena data catalogs based on the provided map
resource "aws_athena_data_catalog" "default" {
  for_each    = var.enabled ? var.data_catalogs : {}
  name        = "${var.name}-${each.key}"
  description = each.value.description
  type        = each.value.type
  parameters  = each.value.parameters

  tags = merge(
    var.tags,
    { Name = "${var.name}-${each.key}" }
  )
}

# Athena named query configuration
# Creates Athena named queries based on the provided map
resource "aws_athena_named_query" "default" {
  for_each    = var.enabled ? var.named_queries : {}
  name        = "${var.name}-${each.key}"
  workgroup   = aws_athena_workgroup.default[0].id
  database    = aws_athena_database.default[each.value.database].name
  query       = each.value.query
  description = each.value.description
}
