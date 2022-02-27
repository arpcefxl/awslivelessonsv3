resource "aws_eip" "nat2" {
  count = 1
  vpc = true
}

module "vpc-accepter" {
  source = "terraform-aws-modules/vpc/aws"
  name = "vpc-accepter"
  cidr = "10.1.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  private_subnets = ["10.1.51.0/24", "10.1.52.0/24", "10.1.53.0/24"]
  database_subnets = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
  public_subnet_suffix = "public-subnet"
  private_subnet_suffix = "private-subnet"
  database_subnet_suffix = "database-subnet"
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_nat_gateway = true
  single_nat_gateway = true
  external_nat_ip_ids = "${aws_eip.nat2.*.id}"
  enable_vpn_gateway = true
  tags = {
    Terraform   = "true"
    Environment = "dev"
    costcenter  = "demo"
  }
}
