resource "aws_ses_domain_identity" "this" {
  domain = data.aws_route53_zone.this.name
}

resource "aws_ses_domain_mail_from" "this" {
  domain                 = aws_ses_domain_identity.this.domain
  mail_from_domain       = "${var.mail-from-domain}.${aws_ses_domain_identity.this.domain}"
  behavior_on_mx_failure = "RejectMessage"
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
}

resource "aws_ses_domain_identity_verification" "this_verification" {
  domain = aws_ses_domain_identity.this.domain

  depends_on = [aws_route53_record.this_amazonses_verification_record]
}