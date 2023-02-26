resource "aws_iam_role" "github-admin" {
  name = "github-admin"
  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            AWS = [
              aws_iam_user.aleks.arn,
              aws_iam_user.tf_github.arn,
            ]
          }
        },
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "github-admin" {
  policy_arn = aws_iam_policy.TFAdminForGitHub.arn
  role       = aws_iam_role.github-admin.name
}


resource "aws_iam_role" "s3-admin" {
  name = "s3-admin"
  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            AWS = [
              aws_iam_user.aleks.arn,
              aws_iam_user.tf_s3.arn,
            ]
          }
        },
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "s3-admin" {
  policy_arn = aws_iam_policy.TFAdminForS3.arn
  role       = aws_iam_role.s3-admin.name
}
