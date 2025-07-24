terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "your-organization-name"  # Replace with your Terraform Cloud org
    workspaces {
      name = "your-workspace-name"           # Replace with your workspace name
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Define a sensitive variable for password
variable "anbu_password" {
  type      = string
  sensitive = true
}

# Create IAM user
resource "aws_iam_user" "anbu_user" {
  name = "anbu"
}

# Assign login profile with password
resource "aws_iam_user_login_profile" "anbu_login" {
  user                    = aws_iam_user.anbu_user.name
  password                = var.anbu_password
  password_reset_required = true
}


