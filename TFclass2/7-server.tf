resource "aws_instance" "ubuntu_server" {
  ami                         = data.aws_ami.ubuntu_server.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnets["public_subnet_1"].id
  security_groups             = [aws_security_group.vpc-ping.id, aws_security_group.ingress-ssh.id, aws_security_group.vpc-web.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated.key_name
  tags = local.common_tags
  connection {
    user        = "ubuntu"
    private_key = tls_private_key.generated.private_key_pem
    host        = self.public_ip
  }

  lifecycle {
    ignore_changes = [security_groups]
  }

}

# Terraform Data Block - Lookup Ubuntu 22.04
data "aws_ami" "ubuntu_server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

/*resource "aws_instance" "aws_linux" {
  instance_type = "t2.micro"
  ami           = "ami-063d43db0594b521b"

}*/