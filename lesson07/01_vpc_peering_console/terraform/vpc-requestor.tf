resource "aws_eip" "nat1" {
  count = 1
  vpc = true
}

module "vpc-requestor" {
  source = "terraform-aws-modules/vpc/aws"
  name = "vpc-requestor"
  cidr = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.51.0/24", "10.0.52.0/24", "10.0.53.0/24"]
  database_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  public_subnet_suffix = "public-subnet"
  private_subnet_suffix = "private-subnet"
  database_subnet_suffix = "database-subnet"
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_nat_gateway = true
  single_nat_gateway = true
  external_nat_ip_ids = "${aws_eip.nat1.*.id}"
  enable_vpn_gateway = true
  tags = {
    Terraform   = "true"
    Environment = "dev"
    costcenter  = "demo"
  }
}
