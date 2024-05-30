resource "aws_route53_zone" "zone" {
  name = var.domain
}

resource "aws_route53_record" "dkim" {
  count   = 3
  zone_id = aws_route53_zone.zone.zone_id
  name    = "${element(var.dkim_tokens, count.index)}._domainkey.${var.domain}."
  type    = "CNAME"
  ttl     = 1800
  records = ["${element(var.dkim_tokens, count.index)}.dkim.amazonses.com"]
}
