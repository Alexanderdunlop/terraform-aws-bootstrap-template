variable "project_name" {
  description = "Name of the project"
  type        = string
}

locals {
  state_bucket_name = "${var.project_name}-terraform-state"
  dynamodb_table_name = "${var.project_name}-terraform-locks"
  iam_terraform_role_name = "${var.project_name}-terraform-deployment-role"
  iam_terraform_role_policy_name = "${var.project_name}-terraform-deployment-policy"
  iam_github_actions_user_name = "${var.project_name}-github-actions"
  iam_github_actions_policy_name = "${var.project_name}-github-actions-policy"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "additional_policy_statements" {
  description = "Additional IAM policy statements to add to the Terraform deployment role"
  type        = list(any)
  default     = []
}