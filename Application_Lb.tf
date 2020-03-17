data "aws_instances" "ec2" {
  depends_on = ["aws_autoscaling_group.asg"]
  instance_tags = {
    Name = "flaconi-ec2"
  }
}
resource "aws_lb" "pub_alb" {
  name               = "Flaconi-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.ALB_sg.id}"]
  subnets            = ["${aws_subnet.public_subnet.id}", "${aws_subnet.public_subnet_2.id}"]

  enable_deletion_protection = true

  access_logs {
    bucket  = "${aws_s3_bucket.log_bucket.id}"
    prefix  = "Flaconi-access-lb-logs"
    enabled = true
  }

  tags = {
    Environment = "production"
    Name = "Public_Alb"
  }
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "Public-ALB-target"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.main.id}"
}
resource "aws_lb_target_group_attachment" "this" {
  depends_on = ["aws_autoscaling_group.asg"]
  target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  target_id        = "${data.aws_instances.ec2.id}"
  port             = 80
}

resource "aws_lb_listener" "pub_alb_list" {
  load_balancer_arn = "${aws_lb.pub_alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "${var.ssl_policy}"
  certificate_arn   = "${var.certificate_arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  }

resource "aws_lb_listener" "pub_alb_list_80" {
  load_balancer_arn = "${aws_lb.pub_alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  }
}
