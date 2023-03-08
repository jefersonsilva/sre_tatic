provider "aws" {
  region = "us-east-1"
  profile = "jef"
}

resource "aws_s3_bucket" "website" {
  bucket = "calculadora-desafio"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "calculator/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": ""
    }
}]
EOF




  tags = {
    Name        = "desafio"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.website.bucket}/*"
      ]
    }
  ]
}
POLICY
}

resource "aws_route53_zone" "zone" {
  name = "jefersonsilva.in"
}

resource "aws_route53_record" "website" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "calculadora.jefersonsilva.in"
  type    = "A"

  alias {
    name                   = aws_s3_bucket.website.website_endpoint
    zone_id                = aws_route53_zone.zone.zone_id
    evaluate_target_health = false
  }
}
