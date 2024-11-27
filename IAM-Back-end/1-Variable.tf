variable "BE-Dev" {
  description = "List of NewHire users"
  type        = list(string)
  default     = ["Teddy", "L", "Mel", "Rob", "Adrian"]
} 
resource "aws_iam_user" "users" {
  count = length(var.BE-Dev)
  name  = var.BE-Dev[count.index]
  tags = {
	Description = "Created through Terraform"
  }
}
resource "aws_iam_user_group_membership" "BE_devop_membership" {
  count = length(var.BE-Dev)

  user = aws_iam_user.users[count.index].name
  groups = [aws_iam_group.BE_devop.name]
}