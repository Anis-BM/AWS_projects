#Example of Attaching admin policy to each user

/*resource "aws_iam_policy" "Admin_Policy" {
  count  = length(var.BE-Dev)
  name   = "UserPolicy$(var.BE-Dev[count.index]}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
	{
  	"Effect": "Allow",
  	"Action": "*",
  	"Resource": "*"
	}
  ]
}
EOF
}
 
resource "aws_iam_user_policy_attachment" "userPolicyAttachment" {
  count      = length(var.BE-Dev)
  user       = aws_iam_user.users[count.index].name
  policy_arn = aws_iam_policy.userPolicy[count.index].arn
}
*/

#These Policies are predefined so we dont need to specify
resource "aws_iam_group_policy_attachment" "BE_devop_vpc_readonly" {
  group      = aws_iam_group.BE_devop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "BE_devop_api_gateway_admin" {
  group      = aws_iam_group.BE_devop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_group_policy_attachment" "BE_devop_dynamodb_fullaccess" {
  group      = aws_iam_group.BE_devop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_group_policy_attachment" "BE_devop_ec2_fullaccess" {
  group      = aws_iam_group.BE_devop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "BE_devop_lambda_fullaccess" {
  group      = aws_iam_group.BE_devop.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
}

resource "aws_iam_group_policy_attachment" "BE_devop_ecs_fullaccess" {
  group      = aws_iam_group.BE_devop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_group_policy_attachment" "BE_devop_s3_readonly" {
  group      = aws_iam_group.BE_devop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}