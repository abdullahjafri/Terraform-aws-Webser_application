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
  description = "ALB listner certificate arn"
  default = ""
}

##################################
#####ASG & Launch COnfig Variables
####################################


variable "max_size" {
  description = "maximum size for autoscaling group"
  default = "3"
}
variable "min_size" {
  default = "2"
  description = "minimum instance asg instances"
}
variable "availability_zones" {
  default = "eu-west-1a"
}
variable "default_cooldown" {
  default = "30"
}
variable "health_check_grace_period" {
  default = "120"
  description = "health check grace period"
}
variable "health_check_type" {
  default = "EC2"
  description = "asg helth check type "
}
variable "desired_capacity" {
  default = "2"
  description = "current instance runnign config"
}
variable "force_delete" {
  default = "false"
  description = "force delete for ASG"
}
variable "termination_policies" {
  description = "Terminating polices for autoscaling group"
  default = "OldestInstance"
}
variable "image_id" {
  description = "image Id to be used with applcation when instaces is launching "
  default = ""
}
variable "instance_type" {
  default = "t2.micro"
  description = "instances type "
}
variable "key_name" {
  description = "SSH Key pair name for ec2 instances"
  default = ""
}
variable "ebs_optimized" {
  default = "false"
  description = "launch configuration ebs optimzation for Ec2 instance"
}

variable "name_asg_lc" {
  default = "Flaconi-lc"
  description = "Launch configuration name"
}
variable "name_asg" {
  description = "ASG name"
  default = "Flaconi-asg_1"
}