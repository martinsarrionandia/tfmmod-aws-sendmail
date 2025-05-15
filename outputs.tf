output "smtp_user" {
  value = aws_iam_access_key.this.id
}

output "smtp_password" {
  sensitive = true
  value     = aws_iam_access_key.this.ses_smtp_password_v4
}