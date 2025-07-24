provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "anbu_user" {
  name = "anbu"
  path = "/"
}


