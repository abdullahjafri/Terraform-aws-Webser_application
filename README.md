## Required Input
SSL certificate, Availablity Zone are required to run this module

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| availability\_zones | n/a | `string` | `"eu-west-1a"` | no |
| aws\_availability\_zone | The availability zone for the public and private subnets | `string` | `"eu-west-1a"` | no |
| aws\_availability\_zone2 | The availability zone for the public and private subnets | `string` | `"eu-west-1b"` | no |
| certificate\_arn | ALB listner certificate arn | `string` | `"arn:aws:acm-pca:eu-west-1:077326381258:certificate-authority/ee38750b-ca89-4a24-a736-13d449fd1d88"` | no |
| default\_cooldown | n/a | `string` | `"30"` | no |
| desired\_capacity | n/a | `string` | `"2"` | no |
| ebs\_optimized | n/a | `string` | `"false"` | no |
| force\_delete | n/a | `string` | `"false"` | no |
| health\_check\_grace\_period | n/a | `string` | `"120"` | no |
| health\_check\_type | n/a | `string` | `"EC2"` | no |
| image\_id | n/a | `string` | `"ami-09a0f9e6eb0837438"` | no |
| instance\_type | n/a | `string` | `"t2.micro"` | no |
| key\_name | n/a | `string` | `"ssh-nekey"` | no |
| max\_size | ################################# ####ASG & Launch COnfig Variables ################################### | `string` | `"3"` | no |
| min\_size | n/a | `string` | `"2"` | no |
| name\_asg | n/a | `string` | `"Flaconi-asg_1"` | no |
| name\_asg\_lc | n/a | `string` | `"Flaconi-lc"` | no |
| private\_subnet\_cidr | The CIDR block for the private subnet | `string` | `"10.0.1.0/24"` | no |
| private\_subnet\_name | The name for the private subnet | `string` | `"Private subnet"` | no |
| public\_ip | Set publc IP for public subnet | `bool` | `true` | no |
| public\_subnet\_cidr | The CIDR block for the public subnet | `string` | `"10.0.0.0/24"` | no |
| public\_subnet\_cidr2 | n/a | `string` | `"10.0.2.0/24"` | no |
| public\_subnet\_name | The name for the public subnet | `string` | `"Public subnet"` | no |
| public\_subnet\_name2 | The name for the public subnet | `string` | `"Public subnet"` | no |
| ssl\_policy | Alb Listner SSl policy | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| termination\_policies | n/a | `string` | `"OldestInstance"` | no |
| vpc\_cidr | The CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| EIP\_NatGateway\_1 | Elastic ID of IP of NatGateway 1 |
| EIP\_NatGateway\_2 | Elastic ID of IP of NatGateway 2 |
| Loadbalancer\_endpoint | andpoint for public loadbalancer |
| Private\_Subnet\_ID | Private subnet ID |
| Public\_Subnet\_1\_ID | public sublet 1 ID |
| Public\_Subnet\_2\_ID | Public Subnet 2 ID |
| vpc\_arn | ARN of Main VPC |
| vpc\_id | ID of Main VPC |
