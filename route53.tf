data "aws_route53_zone" "this" {
  name = var.domain
}

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

resource "aws_route53_record" "this_spf_record" {
  count   = var.create-spf-record ? 1 : 0
  zone_id = data.aws_route53_zone.this.zone_id
  type    = "TXT"
  name    = var.domain
  ttl     = "600"
  records = var.spf-record
}