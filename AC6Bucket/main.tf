provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
  default_tags {
    tags = {
      Owner    = "BlackMuslim"
      Location = "Morocco"
      Created  = "Terraform"
    }
  }
}

resource "aws_s3_bucket" "syslog_bucket" {
  bucket   = "tmmc-syslog-data-tokyo" # Ensure this name is unique globally
  provider = aws.tokyo
  # Prevent bucket deletion during terraform destroy
 /*  lifecycle {
    prevent_destroy = true
  } */
  tags = {
    Name        = "TMMC Syslog Bucket"
    Environment = "Stage1"
    Region      = "Tokyo"
  }
}


#This is necceasry to have the public access to the bucket You also have to go into the aws gui and disable block public access and EEnable Access control list
#This step is normally done at the end after you confirm your enviroment workswith out outside interference
resource "aws_s3_bucket_acl" "syslog_bucket_acl" {
  provider = aws.tokyo
  bucket   = aws_s3_bucket.syslog_bucket.id
  acl      = "private"
}




resource "aws_s3_bucket_policy" "syslog_bucket_policy" {
  provider = aws.tokyo
  bucket   = aws_s3_bucket.syslog_bucket.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowAccessFromTokyo"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "${aws_s3_bucket.syslog_bucket.arn}",
          "${aws_s3_bucket.syslog_bucket.arn}/*"
        ]
        Condition = {
          StringEquals = {
            "aws:RequestedRegion" : "ap-northeast-1"
          }
        }
      },
      {
        Sid       = "ExplicitDenyOtherRegions"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "${aws_s3_bucket.syslog_bucket.arn}",
          "${aws_s3_bucket.syslog_bucket.arn}/*"
        ]
        Condition = {
          StringNotEquals = {
            "aws:RequestedRegion" : "ap-northeast-1"
          }
        }
      }
    ]
  })
}