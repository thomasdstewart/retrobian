module "s3_bucket_repo" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.13.0"

  bucket = "retrobian-hefejeiz"
  #  block_public_acls       = true
  #  block_public_policy     = true
  #  ignore_public_acls      = true
  #  restrict_public_buckets = false
}

#resource "aws_s3_bucket_policy" "s3_bucket_policy_repo" {
#  bucket = module.s3_bucket.s3_bucket_id
#  policy = data.aws_iam_policy_document.s3_bucket_policy_document.json
#}

#data "aws_iam_policy_document" "s3_bucket_policy_document_repo" {
#  statement {
#    effect  = "Allow"
#    actions = ["s3:GetObject"]
#    resources = [
#      "${module.s3_bucket_repo.s3_bucket_arn}",
#      "${module.s3_bucket_repo.s3_bucket_arn}/*"
#    ]
#    principals {
#      type        = "*"
#      identifiers = ["*"]
#    }
#  }
#}
