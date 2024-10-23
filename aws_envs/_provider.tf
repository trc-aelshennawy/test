# Default Provider used to deploy resources to AWS.
provider "aws" {
  region = local.region

  # assume_role {
  #   role_arn = "arn:aws:iam::<123456789876>:role/admin" #Enter Role if used else the role of the pipeline/user will get used for deployments.
  # }
}

# Alias Provider can be used for deploying to different region, e.g us-east-1.
provider "aws" {
  alias  = "use1"
  region = "us-east-1"

  # assume_role {
  #   role_arn = "arn:aws:iam::<aws_account_id>:role/admin" #Enter Role if used
  # }
}
