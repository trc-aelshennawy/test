module "backend" {
  source = "./modules/terraform-aws-remote-state-backend"

  organisation = local.organisation
  system       = local.system
}
output "backend_bucket_name" {
  value = module.backend.tf_state_s3_bucket_name
}

output "backend_dynamodb_table" {
  value = module.backend.tf_state_dynamodb_name
}
