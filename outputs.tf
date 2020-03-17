output "vpc_id" {
  description = "ID of Main VPC"
  value = "${aws_vpc.main.id}"
}
output "vpc_arn" {
  description = "ARN of Main VPC"
  value = "${aws_vpc.main.arn}"
}

output "Loadbalancer_endpoint" {
  description = "andpoint for public loadbalancer"
  value = "${aws_lb.pub_alb.dns_name}"
}

output "Public_Subnet_1_ID" {
  description = "public sublet 1 ID"
  value = "${aws_subnet.public_subnet.id}"
}

output "Public_Subnet_2_ID" {
  description = "Public Subnet 2 ID"
  value = "${aws_subnet.public_subnet_2.id}"
}

output "Private_Subnet_ID" {
  description = "Private subnet ID"
  value = "${aws_subnet.private_subnet.id}"
}

output "EIP_NatGateway_1" {
  description = "Elastic ID of IP of NatGateway 1"
  value = "${aws_nat_gateway.nat_gateway.public_ip}"
}

output "EIP_NatGateway_2" {
  description = "Elastic ID of IP of NatGateway 2"
  value = "${aws_nat_gateway.nat_gateway.public_ip}"
}