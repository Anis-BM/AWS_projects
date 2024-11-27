provider "aws" {
  region = "us-east-2"  # Set your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "anisb_html_bucket" {
  bucket = "anisb-test2-bucket"  # Make sure this name is unique

  # No ACL needed here since we will use bucket policies
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.anisb_html_bucket.id
  

  versioning_configuration {
    status = "Enabled"
  }
}

# Configure the bucket for static website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.anisb_html_bucket.id

  index_document {
    suffix = "index.html"
  }

  # Optionally, specify an error document
  error_document {
    key = "error.html"
  }
}

# Bucket policy to allow public access to objects
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.anisb_html_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.anisb_html_bucket.arn}/*"
      },
    ]
  })
}

# Upload the HTML file
resource "aws_s3_object" "html_file" {
  bucket = aws_s3_bucket.anisb_html_bucket.id
  key    = "index.html"
  source = "index.html"
   # Set the content type to text/html
  content_type = "text/html"
}

# Upload images from the "Images" folder
resource "aws_s3_object" "images" {
  for_each = fileset("Images", "*")

  bucket = aws_s3_bucket.anisb_html_bucket.id
  key    = "Images/${each.value}"
  source = "Images/${each.value}"
}