resource "aws_ecr_repository" "	stockx-poc-repo" {
  name                 = "${local.app_fullname}"
  image_tag_mutability = "MUTABLE"
  tags = local.default_tags
}
resource "aws_iam_user" "publisher" {
  name = local.ecr_publisher_name
  path = "/serviceaccounts/"

  tags = local.default_tags
}

resource "aws_iam_user_policy" "publisher" {
  name = local.ecr_publisher_policy_name
  user = aws_iam_user.publisher.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:PassRole",
        "iam:GetRole",
        "ecs:DescribeTaskDefinition",
        "ecs:DescribeServices",
        "ecs:UpdateService",
        "ecs:RegisterTaskDefinition",
        "ecr:CompleteLayerUpload",
        "ecr:DescribeRepositories",
        "ecr:ListImages",
        "ecr:DescribeImages",
        "ecr:GetAuthorizationToken",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetLifecyclePolicy",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_access_key" "publisher" {
  user = aws_iam_user.publisher.name
}
