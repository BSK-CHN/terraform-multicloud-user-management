provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "anbu" {
  name = "anbu"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "anbu_login" {
  user = aws_iam_user.anbu.name

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_user_policy_attachment" "anbu_policy_attach" {
  user       = aws_iam_user.anbu.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_access_key" "anbu_key" {
  user = aws_iam_user.anbu.name

  lifecycle {
    prevent_destroy = false
  }
}




