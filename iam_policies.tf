resource "aws_iam_policy" "TFAWSAdmin" {
  name        = "TFAWSAdmin"
  description = "Policy that allows Assume TF admin roles"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "sts:AssumeRole",
          "Resource" : [
            aws_iam_role.github-admin.arn,
            aws_iam_role.s3-admin.arn
          ]
        },
      ]
    }
  )
}

resource "aws_iam_policy" "dynamodb-lock" {
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "dynamodb:DescribeTable",
            "dynamodb:GetItem",
            "dynamodb:PutItem",
            "dynamodb:DeleteItem"
          ],
          "Resource" : aws_dynamodb_table.terraform_locks.arn
        }
      ]
  })
}

resource "aws_iam_policy" "TFAdminForGitHub" {
  name        = "TFAdminForGitHub"
  description = "Policy that allows read-write access to the GitHub Terraform state bucket"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
          ],
          "Resource" : [
            "arn:aws:s3:::infrahouse-github-state/*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : "s3:ListBucket",
          "Resource" : "arn:aws:s3:::infrahouse-github-state"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "secretsmanager:CreateSecret",
            "secretsmanager:DeleteSecret",
            "secretsmanager:DescribeSecret",
            "secretsmanager:GetResourcePolicy",
            "secretsmanager:GetSecretValue"
          ],
          "Resource" : [
            "arn:aws:secretsmanager:*:990466748045:secret:_github_control__*"
          ]
        }
      ]
    }
  )
}


resource "aws_iam_policy" "TFAdminForS3" {
  name        = "TFAdminForS3"
  description = "Policy that allows provisioning of S3 buckets"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
          ],
          "Resource" : [
            "arn:aws:s3:::infrahouse-aws-s3-control/*"
          ]
        },
        {
          "Effect" : "Allow",
          "Action" : "s3:ListBucket",
          "Resource" : "arn:aws:s3:::infrahouse-aws-s3-control"
        },
      ]
    }
  )
}
