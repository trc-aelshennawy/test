# aws_utils - AWS Utilities (backend for remote state storage and state-locking):

# Initial workflow:

## 1.) Open terminal in aws_utils (base-setup-full/aws_utils).

## 2.) Run "tofu init" to initialize openTofu in the directory.

## 3.) Edit aws_utils/_locals.tf file and enter system (and organization) name.

## 4.) Run "tofu apply" to apply the code in backend.tf - creating the remote state bucket and DynamoDB table for state storage and state-locking. The name of the resources will be printed in the terminal output.

## 5.) Edit aws_utils/_terraform.tf file. Enter the generated bucket and DynamoDB table name from output in the corresponding fields.

## 6.) Run "tofu init -migrate-state" to migrate the local backend to the remote backend in AWS.

## 7.) Delete the aws_envs/.terraform/terraform.tfstate and aws_envs/.terraform/terraform.tfstate.backup (should be in S3 now).

## 8.) .gitignore will ignore large or sensitive terraform files (e.g., tfstate), and .pre-commit-config.yaml is a tool to "cleanup" before committing to git.

## 9.) Install pre-commit on your OS:
- Run "pre-commit install" to install hooks,
- Run "pre-commit autoupdate" to update to the latest version,
- Run "pre-commit run --all" to run hooks without committing.

Some useful hooks are already in the .pre-commit-config.yaml file, but more can be added if necessary.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | ./modules/terraform-aws-remote-state-backend | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_bucket_name"></a> [backend\_bucket\_name](#output\_backend\_bucket\_name) | n/a |
| <a name="output_backend_dynamodb_table"></a> [backend\_dynamodb\_table](#output\_backend\_dynamodb\_table) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
