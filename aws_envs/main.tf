# First file for openTofu Code related to the workload.
resource "aws_vpc" "test" {
  cidr_block = "10.55.0.0/16"

}

# Github OIDC Provider: connection IAM <-> GitHub (trust Tokens from OIDC Provider)
resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list  = ["sts.amazonaws.com"] #audience
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

# IAM Role: allow GitHub Actions to assume role
resource "aws_iam_role" "github_actions" {
  name               = "github_actions_role"
  assume_role_policy = data.aws_iam_policy_document.github_allow.json
}

# IAM Trust Policy: connection IAM <-> GitHub Actions/Repository
data "aws_iam_policy_document" "github_allow" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_actions.arn]
    }
    condition {
      test     = "StringLike"                                                 # Ändern falls einzelner Zugriff auf Repos und Wildcard Operator wirdn icht genutzt -> StringEquals
      variable = "token.actions.githubusercontent.com:sub"                    # GitHub OIDC Provider Subject -> Defines the repositories allowed to use this role
      values   = ["repo:${local.github_organisation}/${local.github_repo}:*"] #TODO: Eine Rolle für alle Repos? Oder Repo einzeln? (${github_repo}:*) oder Zugriff anders beschränken? 
    }
    condition {
      test     = "StringEqual"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    #TODO: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_iam-condition-keys.html#condition-keys-wif - AWS IAM condition keys
    # e.g. Filtering on sub key: for pull_request events (repo:ORG-NAME/REPO-NAME:pull_request), specific branches (repo:ORG-NAME/REPO-NAME:ref:refs/heads/BRANCH-NAME),
    # tags (repo:ORG-NAME/REPO-NAME::ref:refs/tags/TAG-NAME)
  }
}
