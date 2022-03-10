data "aws_ami" "amazonlinux2_us_east_1" {
  provider    = aws.us-east-1
  most_recent = true
  filter {
    name   = "name"
#    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    values = ["amzn2-ami-hvm-*-arm64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}
