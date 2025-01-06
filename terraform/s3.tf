module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.3.0"

  bucket                  = "retrobian-ouquejei"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = module.s3_bucket.s3_bucket_id
  policy = data.aws_iam_policy_document.s3_bucket_policy_document.json
}

data "aws_iam_policy_document" "s3_bucket_policy_document" {
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject"]
    resources = [
      "${module.s3_bucket.s3_bucket_arn}",
      "${module.s3_bucket.s3_bucket_arn}/*"
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}
