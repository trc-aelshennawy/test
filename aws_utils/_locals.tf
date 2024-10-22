locals {
  # AWS Region used to deploy resources (specifiying the Provider region).
  region = "eu-central-1"
  # "Organisation + System" used to name the backend resources.
  organisation = "ae"    # Change: Name of Organisation
  system       = "ci-cd" # Change: Name of Project / Workload
}
