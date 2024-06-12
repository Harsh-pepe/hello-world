provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "10.0.0.0/16"
}

module "private_subnet" {
  source       = "./modules/subnet"
  vpc_id       = module.vpc.vpc_id
  subnet_cidr  = "10.0.1.0/24"
}

module "ec2_instance" {
  source          = "./modules/ec2"
  subnet_id       = module.private_subnet.subnet_id
  instance_type   = "t3.medium"
  key_name        = "your_key_pair_name"
  volume_size     = 300
  ami             = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
}
