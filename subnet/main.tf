resource "aws_subnet" "this" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "main-subnet"
  }
}

output "subnet_idd" {
  value = aws_subnet.this.id
}
