locals {
  tags = merge(var.tags, {
    Terraform_Module_Name = "terraform-aws-remote-state-backend"
  })
}
