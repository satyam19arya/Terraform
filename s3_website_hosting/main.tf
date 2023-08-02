resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucketname

  tags = {
    Name = "terraform-demo"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_website" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = "index.html"
  source = "index.html"

  content_type = "text/html"
}

locals {
  s3_origin_id   = "${var.bucketname}.s3.us-east-1.amazonaws.com"
  s3_domain_name = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = local.s3_domain_name
    origin_id   = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.example.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_origin_access_identity" "example" {
  comment = "${var.bucketname}.s3.us-east-1.amazonaws.com"
}

resource "aws_s3_bucket_policy" "s3_access_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = jsonencode({
    Version : "2012-10-17",
    Id : "PolicyForCloudFrontPrivateContent",
    Statement : [
      {
        Sid : "1",
        Effect : "Allow",
        Principal : {
          AWS = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.example.id}"]
        },
        Action : [
          "s3:GetObject"
        ],
        Resource : [
          "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}/*"
        ]
      }
    ]
  })
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}