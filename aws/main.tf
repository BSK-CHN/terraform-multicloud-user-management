# main.tf
provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_iam_user" "my_user" {
  name = "multicloud-admin"
  force_destroy = true
}

resource "aws_iam_group" "admin_group" {
  name = "AdminGroup"
}

resource "aws_iam_group_policy_attachment" "admin_attach" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_group_membership" "user_in_group" {
  user = aws_iam_user.my_user.name
  groups = [aws_iam_group.admin_group.name]
}

