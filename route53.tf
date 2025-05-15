resource "aws_route53_record" "this_amazonses_dkim_record" {
  count   = var.dkim-record-count
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${aws_ses_domain_dkim.this.dkim_tokens[count.index]}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${aws_ses_domain_dkim.this.dkim_tokens[count.index]}.dkim.amazonses.com"]
}

resource "aws_route53_record" "this_amazonses_verification_record" {
  zone_id = data.aws_route53_zone.this.zone_id
  type    = "TXT"
  name    = "_amazonses.${aws_ses_domain_identity.this.domain}"
  ttl     = "600"
  records = [aws_ses_domain_identity.this.verification_token]
}

resource "aws_route53_record" "this_amazonses_dmarc_record" {
  zone_id = data.aws_route53_zone.this.zone_id
  type    = "TXT"
  name    = "_dmarc.${aws_ses_domain_identity.this.domain}"
  ttl     = "600"
  records = ["v=DMARC1; p=none;"]
}

resource "aws_route53_record" "this_spf_record" {
  zone_id = data.aws_route53_zone.this.zone_id
  type    = "TXT"
  name    = aws_ses_domain_mail_from.this.mail_from_domain
  ttl     = "600"
  records = var.spf-record
}

resource "aws_route53_record" "this_ses_domain_mail_from_mx" {
  zone_id = aws_route53_zone.this.id
  name    = aws_ses_domain_mail_from.this.mail_from_domain
  type    = "MX"
  ttl     = "600"
  records = ["10 ${local.mx_record}"]
}