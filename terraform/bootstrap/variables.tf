variable "project_name" {
  description = "Name of the project"
  type        = string
}

locals {
  state_bucket_name = "${var.project_name}-terraform-state"
  dynamodb_table_name = "${var.project_name}-terraform-locks"
  iam_role_name = "${var.project_name}-terraform-deployment-role"
  iam_role_policy_name = "${var.project_name}-terraform-deployment-policy"
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