provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "admin_user" {
  name = "jenkins"
  tags = {
    description = "created from local"
  }
}

resource "aws_iam_policy" "admin_policy" {
  name   = "Admin_Users_policy"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
  user       = aws_iam_user.admin_user.name
  policy_arn = aws_iam_policy.admin_policy.arn
}
