
resource "aws_launch_configuration" "lc" {
  name                             = "${var.name_asg_lc}"
  image_id                         = "${var.image_id}"
  instance_type                    = "${var.instance_type}"
  key_name                         = "${var.key_name}"
  security_groups                  = ["${aws_security_group.ec2_sg.id}"]
  ebs_optimized                    = "${var.ebs_optimized}"
}

# ---------------------------------------------------------------------------------------------------------------------
# Auto Scaling Group
# ---------------------------------------------------------------------------------------------------------------------


resource "aws_autoscaling_group" "asg" {
  name                      = "${var.name_asg}"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  availability_zones        = ["${var.availability_zones}"]
  default_cooldown          = "${var.default_cooldown}"
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  desired_capacity          = "${var.desired_capacity}"
  force_delete              = "${var.force_delete}"
  vpc_zone_identifier       = ["${aws_subnet.private_subnet.id}"]
  target_group_arns         = ["${aws_lb_target_group.alb_tg.arn}"]
  termination_policies      = ["${var.termination_policies}"]
  tags = [
    {
      key                 = "Name"
      value               = "${var.name_asg_lc}_asg"
      propagate_at_launch = false
    },
    {
      key                 = "Name"
      value               = "flaconi-ec2"
      propagate_at_launch = true
    },

  ]
}