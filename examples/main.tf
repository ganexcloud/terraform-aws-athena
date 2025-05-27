module "athena" {
  source                  = "../"
  name                    = "athena-infra"
  bucket_name             = "athena"
  s3_output_path          = "infra/"
  workgroup_force_destroy = true

  databases = {
    test = {
      force_destroy = true
    }
  }

  named_queries = {
    test = {
      database    = "test"
      description = "Example query"
      query       = "SELECT * FROM %s limit 10;"
    }
  }
}
