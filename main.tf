provider "aws" {
    region = "us-east-1"
    profile = "jef"
  
}
resource "aws_s3_bucket" "website" {
  bucket = "calc.jefersonsilva.in"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = "calculadora"
    Environment = "Production"
  }
}



resource "aws_route53_record" "calcdesafio" {
  zone_id = "Z04130716X3SCR9L4MV9"
  name    = "calc.jefersonsilva.in"
  type    = "A"

  alias {
    name                   = aws_s3_bucket.website.website_domain
    zone_id                = aws_s3_bucket.website.hosted_zone_id
    evaluate_target_health = false
  }
}


