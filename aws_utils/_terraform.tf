terraform {
  required_version = "~> 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.72"
    }
  }

  backend "s3" {
    region         = "eu-central-1"
    bucket         = "ae-ci-cd-2562-state-tflz"     # Enter s3 bucket name for openTofu state
    key            = "backend.tfstate"              # Enter prefix for openTofu state (e.g. backend, utils) - multiple environments or projects can use the same bucket. Use different prefix for backend/aws_utils and aws_envs
    dynamodb_table = "ae-ci-cd-2562-locktable-tflz" # Enter dynamoDB name for state locking table.
    encrypt        = true
  }
}
