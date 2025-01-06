resource "aws_acm_certificate" "acm_certificate" {
  domain_name = "retrobian.org.uk"
  subject_alternative_names = [
    "retrobian.org.uk",
    "img.retrobian.org.uk",
    "repo.retrobian.org.uk"
  ]

  validation_method = "DNS"
  provider          = aws.us-east-1
}
