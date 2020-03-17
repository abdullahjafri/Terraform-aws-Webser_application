variable "vpc_cidr" {
  type        = "string"
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
}

variable "public_ip" {
  default = true
  description = "Set publc IP for public subnet"
}

variable "public_subnet_name" {
  type        = "string"
  default     = "Public subnet"
  description = "The name for the public subnet"
}
variable "public_subnet_name2" {
  type        = "string"
  default     = "Public subnet"
  description = "The name for the public subnet"
}

variable "public_subnet_cidr" {
  type        = "string"
  default     = "10.0.0.0/24"
  description = "The CIDR block for the public subnet"
}
variable "public_subnet_cidr2" {
  default = "10.0.2.0/24"
}

variable "private_subnet_name" {
  type        = "string"
  default     = "Private subnet"
  description = "The name for the private subnet"
}

variable "private_subnet_cidr" {
  type        = "string"
  default     = "10.0.1.0/24"
  description = "The CIDR block for the private subnet"
}

variable "aws_availability_zone" {
  type        = "string"
  description = "The availability zone for the public and private subnets"
  default = ""
}
variable "aws_availability_zone2" {
  type        = "string"
  description = "The availability zone for the public and private subnets"
  default = ""
}

variable "ssl_policy" {
  type        = "string"
  default = "ELBSecurityPolicy-2016-08"
  description = "Alb Listner SSl policy"
}

variable "certificate_arn" {
  type        = "string"
  default = ""
  description = "ALB listner certificate arn"
}

##################################
#####ASG & Launch COnfig Variables
####################################
variable "max_size" {
  default = "3"
}
variable "min_size" {
  default = "2"
}
variable "availability_zones" {
  default = "eu-west-1a"
}
variable "default_cooldown" {
  default = "30"
}
variable "health_check_grace_period" {
  default = "120"
}
variable "health_check_type" {
  default = "EC2"
}
variable "desired_capacity" {
  default = "2"
}
variable "force_delete" {
  default = "false"
}
variable "termination_policies" {
  default = "OldestInstance"
}
variable "image_id" {
  default = ""
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "ssh-nekey"
}
variable "ebs_optimized" {
  default = "false"
}

variable "name_asg_lc" {
  default = "Flaconi-lc"
}
variable "name_asg" {
  default = "Flaconi-asg_1"
}