variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use"
  type        = string
}

variable "volume_size" {
  description = "The size of the volume in GB"
  type        = number
}
