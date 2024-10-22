# aws_envs - AWS Environment ( for the code of the workload/project/infrastructure):

# Initial workflow:

## 1.) Open terminal in aws_envs (base-setup-full/aws_envs).

## 2.) Edit aws_utils/_locals.tf file and enter system (and organization) name and optionally adjust common tags (can be used for tagging resources).

## 3.) Edit aws_envs/_terraform.tf file. Enter the generated bucket and DynamoDB table name that was generated with aws_utils. Only the prefix should differ from the terraform.tf file in aws_utils

## 4.) Run "tofu init" to initialize openTofu in the directory. And create a state in the remote state backend.

## 5.) Author/Write opentofu code (e.g. in main.tf) and run "tofu apply" or use a pipeline to apply the code.

## 6.) .gitignore will ignore large or sensitive terraform files (e.g., tfstate), and .pre-commit-config.yaml is a tool to "cleanup" before committing to git.

## 7.) Install pre-commit on your OS:
- Run "pre-commit install" to install hooks,
- Run "pre-commit autoupdate" to update to the latest version,
- Run "pre-commit run --all" to run hooks without committing.

Some useful hooks are already in the .pre-commit-config.yaml file, but more can be added if necessary.
