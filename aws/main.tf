provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "anbu_user" {
  name = "anbu"
}

resource "aws_iam_user_login_profile" "anbu_login" {
  user    = aws_iam_user.anbu_user.name
  password = "Anbu@12345"  # Change to a strong password!
  password_reset_required = true
}

resource "aws_iam_group" "admin_group" {
  name = "AdminGroup"
}

resource "aws_iam_group_policy_attachment" "admin_group_attach" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_group_membership" "anbu_group_membership" {
  user = aws_iam_user.anbu_user.name
  groups = [
    aws_iam_group.admin_group.name
  ]
}


