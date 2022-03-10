resource "aws_default_vpc" "default" {
  provider = aws.us-east-1
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "us_east_1_ec2" {
  provider    = aws.us-east-1
  ami           = "${data.aws_ami.amazonlinux2_us_east_1.id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${module.us_east_1_security_group.security_group_id}"]
  iam_instance_profile   = aws_iam_instance_profile.ec2_demo_instance_profile.name

  tags = {
    Name = "us-east-1-ec2"
    costcenter = "demo"
    ssm = "true"
    }
}

resource "aws_instance" "us_east_1_ec2_2" {
  provider    = aws.us-east-1
  ami           = "${data.aws_ami.amazonlinux2_us_east_1.id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${module.us_east_1_security_group.security_group_id}"]
  iam_instance_profile   = aws_iam_instance_profile.ec2_demo_instance_profile.name

  tags = {
    Name = "us-east-1-ec2-2"
    costcenter = "demo"
    ssm = "true"
    }
}

module "us_east_1_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.us-east-1
  }
  name               = "us-east-1-security-group"
  description        = "test security group"
  vpc_id             = aws_default_vpc.default.id
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
}
