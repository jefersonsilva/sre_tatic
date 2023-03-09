resource "aws_s3_bucket" "website" {
  bucket = join(".", [var.bucket_name, var.deafault_domain])
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = var.tag_name
    Environment = var.tag_env
  }
}

resource "aws_route53_record" "calcdesafio" {
  zone_id = var.deafault_route_53_zone
  name    = join(".", [var.bucket_name, var.deafault_domain])
  type    = "A"

  alias {
    name                   = aws_s3_bucket.website.website_domain
    zone_id                = aws_s3_bucket.website.hosted_zone_id
    evaluate_target_health = false
  }
}