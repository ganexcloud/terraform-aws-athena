module "athena" {
  source = "../../"

  name                    = "ganex-athena-example"
  bucket_name             = "ganex-athena-example-results"
  s3_output_path          = "results/"
  workgroup_force_destroy = true

  databases = {
    example = {
      force_destroy = true
    }
  }

  named_queries = {
    example = {
      database    = "example"
      description = "Example query"
      query       = "SELECT 1"
    }
  }

  tags = {
    Example = "terraform-aws-athena"
  }
}
