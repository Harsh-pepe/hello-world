resource "aws_vpc" "annexon_dev" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "annexon_dev_private" {
  vpc_id            = aws_vpc.annexon_dev.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "my-private-subnet"
  }
}

data "aws_availability_zones" "available" {}

