locals {
  region       = "eu-central-1"
  organisation = "gedak"       # Change: Name of Organisation
  system       = "environment" # Change: Name of Project / Workload

  # Fill out common tags based on definition of workload (given by app owner) used to tag resources in AWS.
  common_tags = {
    Terraform   = true
    "appOwner"  = "gedak"
    "ManagedBy" = "terraform"
    # "Repository"  = "" # Enter Git Repo URL
    # "creator"     = "" # Enter creator of repository
    # "Environment" = "" # Enter Environment (e.g. dev, staging, prod)
  }

  # Pipeline locals  #TODO: Change after testing.
  github_organisation = "trc-aelshennawy"
  github_repo         = "test"
  
}
