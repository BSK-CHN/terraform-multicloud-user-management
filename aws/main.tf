provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user_login_profile" "anbu_login" {
  user = aws_iam_user.anbu_user.name
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_user_policy_attachment" "anbu_policy_attach" {
  user       = aws_iam_user.anbu_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" # or any attached policy
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_user" "anbu_user" {
  name = "anbu"
  force_destroy = true
}



