resource "aws_security_group" "ALB_sg" {
  name        = "Alb_Security_group"
  description = "Allow incoming traffic on masters load balancer"
  vpc_id      = "${aws_vpc.main.id}"
  tags = {
    Name        = "LoadBalancer_security_group"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_Security_group"
  description = "Allow incoming traffic from masters load balancer on ec2 instance"
  vpc_id      = "${aws_vpc.main.id}"
  tags = {
    Name        = "ec2_security_group"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.ALB_sg.id}"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = ["${aws_security_group.ALB_sg.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}