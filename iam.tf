resource "aws_iam_user" "this" {
  name = "${local.relay_name}-smtp-user"
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_group" "this_ses_group" {
  name = "AWSSESSendingGroupDoNotRename"
}

resource "aws_iam_group_membership" "this_ses_group_membership" {
  name = "${local.relay_name}-ses-relay-group-membership"
  users = [
    aws_iam_user.this.name,
  ]
  group = aws_iam_group.this_ses_group.name
}

resource "aws_iam_group_policy" "ses_relay_group_policy" {
  name  = "${local.relay_name}-ses-relay-group-policy"
  group = aws_iam_group.this_ses_group.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "ses:SendRawEmail"
        Resource = "*"
      },
    ]
  })
}