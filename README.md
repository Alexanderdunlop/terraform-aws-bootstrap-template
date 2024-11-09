# Terraform AWS Bootstrap Template

A template repository for bootstrapping new AWS projects with Terraform. Includes S3 backend configuration, state locking with DynamoDB, IAM roles, and GitHub Actions CI/CD pipeline.

## Features

- ✨ S3 backend for state storage
- 🔒 DynamoDB table for state locking
- 👤 IAM roles for Terraform deployment
- 🔄 GitHub Actions workflow
- 📝 Basic project structure
- 🔐 Self-managing IAM permissions
- 🏷️ Project-specific resource naming

## Usage

### Creating a New Project

1. Click the "Use this template" button at the top of this repository
2. Choose a name for your new repository
3. Select public or private visibility
4. Click "Create repository from template"

### Initial Setup

1. Clone your new repository
2. Deploy the bootstrap infrastructure:
   ```bash
   cd terraform/bootstrap
   terraform init
   terraform apply -var="project_name=my-project"
    ```
    This will create:
        - S3 bucket: `my-project-terraform-state`
        - DynamoDB table: `my-project-terraform-locks`
        - IAM role: `my-project-terraform-deployment-role`
3. Note the outputs:
    - `state_bucket_name`
    - `dynamodb_table_name`
    - `terraform_role_arn`
4. Update the backend configuration in `terraform/provider.tf` with the outputs:
    ```hcl
    backend "s3" {
        bucket         = "my-project-terraform-state"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "my-project-terraform-locks"
        encrypt        = true
    }
    ```
5. Update `terraform.tfvars` file in the root terraform directory:
    ```hcl
    project_name       = "my-project"
    terraform_role_arn = "arn:aws:iam::ACCOUNT_ID:role/my-project-terraform-deployment-role"
    ```
6. Set up GitHub Actions secrets::
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY`

### Adding Infrastructure

1. Add your infrastructure code to `main.tf`
2. Add any required variables to `variables.tf`
3. Add any outputs to `outputs.tf`
4. If you need additional IAM permissions, add them to `bootstrap/main.tf` in the `additional_policy_statements` variable

### Directory Structure

```
.
├── .github
│   └── workflows
│       └── terraform.yml
├── terraform
│   ├── bootstrap
│   │   ├── main.tf        # Bootstrap infrastructure (S3, DynamoDB, IAM)
│   │   ├── variables.tf   # Bootstrap variables
│   │   └── outputs.tf     # Bootstrap outputs
│   ├── main.tf           # Main infrastructure
│   ├── provider.tf       # AWS provider and backend configuration
│   ├── variables.tf      # Infrastructure variables
│   └── outputs.tf        # Infrastructure outputs
├── .gitignore
└── README.md
```

### Prerequisites

- AWS Account
- Terraform >= 1.0
- GitHub account
- AWS CLI configured with appropriate credentials

### Security Features

- 🔒 S3 bucket encrypted by default
- 🔐 State locking enabled
- 👤 IAM roles follow least privilege principle
- 🔑 Self-managing IAM permissions
- 🏷️ Project-specific resource naming to prevent conflicts
- 🔐 GitHub Actions secrets for AWS credentials

### Contributing

- Contributions are welcome! Please feel free to submit a Pull Request.

### License

MIT License - feel free to use this template for your own projects.