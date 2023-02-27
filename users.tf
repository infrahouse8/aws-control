resource "aws_iam_user" "aleks" {
  name = "aleks"
  tags = merge(local.common_tags)
}

resource "aws_iam_access_key" "aleks" {
  user = aws_iam_user.aleks.name
}

resource "aws_iam_user" "tf_github" {
  name = "tf_github"
  tags = merge(local.common_tags)
}

resource "aws_iam_access_key" "tf_github" {
  user = aws_iam_user.tf_github.name
}


resource "aws_iam_user" "tf_s3" {
  name = "tf_s3"
  tags = merge(local.common_tags)
}

resource "aws_iam_access_key" "tf_s3" {
  user = aws_iam_user.tf_s3.name
}
