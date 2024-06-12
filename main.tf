provider "aws" {
  region = "us-east-1"
  access_key = ${{ secrets.your_access_key_id }}
  secret_key = ${{ secrets.your_secret_access_key }}
}

module "vpc" {
  source       = "./vpc"
  vpc_cidr     = "10.0.0.0/16"
}

module "private_subnet" {
  source       = "./subnet"
  vpc_id       = module.vpc.vpc_id
  subnet_cidr  = "10.0.1.0/24"
}

module "ec2_instance" {
  source          = "./ec2"
  subnet_id       = module.private_subnet.subnet_id
  instance_type   = "t3.medium"
  key_name        = "your_key_pair_name"
  volume_size     = 300
  ami             = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
}
