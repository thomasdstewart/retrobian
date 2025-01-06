module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "4.0.0"

  aliases = [
    "retrobian.org.uk",
    "img.retrobian.org.uk",
    "repo.retrobian.org.uk"
  ]

  comment             = "retrobian.org.uk"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false

  origin = {
    "retrobian-ouquejei" = {
      domain_name = module.s3_bucket.s3_bucket_bucket_domain_name
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]

      }
    }
  }

  default_cache_behavior = {
    target_origin_id       = "retrobian-ouquejei"
    viewer_protocol_policy = "allow-all"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    compress                     = true
    cache_policy_name            = "Managed-CachingOptimized"
    response_headers_policy_name = "Managed-SecurityHeadersPolicy"
    use_forwarded_values         = false
  }

  viewer_certificate = {
    acm_certificate_arn      = aws_acm_certificate.acm_certificate.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}

output "cloudfront" {
  value = "@ img.retrobian.org.uk CNAME ${module.cloudfront.cloudfront_distribution_domain_name}."
}
