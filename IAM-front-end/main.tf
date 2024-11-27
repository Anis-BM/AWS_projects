#Lets build code for IAM policy, user, groups, and access keys with terraform for AWS

provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

# Create an S3 bucket named anisb-test-bucket
resource "aws_s3_bucket" "anisb_test_bucket" {
  bucket = "anisb-test-bucket"

  # Optional: enable versioning
  versioning {
    enabled = true
  }

  # Optional: add server-side encryption for objects
 /* server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }*/

  tags = {
    Name        = "anisb-test-bucket"
    Environment = "Test"
  }
}

# Create an IAM policy
resource "aws_iam_policy" "S3-Readwriteonly" {
  name        = "S3-Readwriteonly"
  description = "An IAM policy for S3 bucket List access and access read and write only, with explict deny for deletion."
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket", # Allows listing the S3 bucket
          "s3:GetObject", # Allows reading objects from S3
          "s3:Putobject" # Allows writing/uploading objects to S3
        ]
        Resource = [
          "arn:aws:s3:::anisb-test-bucket",             # Your bucket (change this)
          "arn:aws:s3:::anisb-test-bucket/*"            # All objects in your bucket (change this)
        ]
      },
       {
        Effect = "Deny"
        Action = [
          "s3:DeleteObject"       # Explicitly denies deleting objects from S3
        ]
        Resource = "arn:aws:s3:::anisb-test-bucket/*"    # Apply to all objects in the bucket
      }
    ]
  })
}

resource "aws_iam_policy" "cloudfront_full_access_policy" {
  name        = "CloudFrontFullAccessPolicy"
  description = "IAM policy for CloudFront Full Access"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "cloudfront:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# Create the IAM policy for Route 53 Full Access
resource "aws_iam_policy" "route53_full_access_policy" {
  name        = "Route53FullAccessPolicy"
  description = "IAM policy for full access to Route 53"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "route53:*",
          "route53domains:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}



# Create an IAM group
resource "aws_iam_group" "front-end_developer" {
  name = "front-end_developer"
}

# Attach the policies to the group
# Attaching S3 custom policy
resource "aws_iam_policy_attachment" "s3_policy_attachment" {
  name       = "s3-policy-attachment"
  policy_arn = aws_iam_policy.S3-Readwriteonly.arn
  groups     = [aws_iam_group.front-end_developer.name]
}

# Attaching CloudFront Full Access policy
resource "aws_iam_policy_attachment" "cloudfront_policy_attachment" {
  name       = "cloudfront-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
  groups     = [aws_iam_group.front-end_developer.name]
}

# Attaching Route 53 Full Access policy
resource "aws_iam_policy_attachment" "route53_policy_attachment" {
  name       = "route53-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  groups     = [aws_iam_group.front-end_developer.name]
}

# Attaching ACM Full Access policy
resource "aws_iam_policy_attachment" "acm_policy_attachment" {
  name       = "acm-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSCertificateManagerFullAccess"
  groups     = [aws_iam_group.front-end_developer.name]
}




# Create an IAM user
resource "aws_iam_user" "Motivated_Mindstate" {
  name = "Motivated_Mindstate"
}

# Attach the user to the group
resource "aws_iam_user_group_membership" "front-end_developer" {
  user  = aws_iam_user.Motivated_Mindstate.name
  groups = [aws_iam_group.front-end_developer.name]
}

# Create IAM user access keys
resource "aws_iam_access_key" "Motivated_Mindstate_access_key" {
  user = aws_iam_user.Motivated_Mindstate.name
}

#CLI Commands -Create
#aws iam create-user --user-name Jay
#aws iam create-group --group-name Back-End_Developers
#aws iam add-user-to-group --user-name Jay --group-name Back-End_Developers
#aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --group-name Back-End_Developers
#aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --user-name Jay
#CLI Commands -Remove
#aws iam remove-user-from-group --user-name Jay --group-name Back-End_Developers
#aws iam list-attached-group-policies --group-name Back-End_Developers
#aws iam detach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --group-name Back-End_Developers
#aws iam delete-group --group-name Back-End_Developers
#aws iam list-attached-user-policies --user-name Jay
#aws iam detach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --user-name Jay
