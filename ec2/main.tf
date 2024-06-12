resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "main-instance"
  }
}

output "instance_idd" {
  value = aws_instance.this.id
}

output "public_ipp" {
  value = aws_instance.this.public_ip
}
