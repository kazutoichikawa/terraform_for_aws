# ---------------------------------------------
# ALB
# ---------------------------------------------
resource "aws_lb" "eikatsu-alb" {
  name               = "${var.service_name}-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type = "ipv4"

  security_groups    = [var.security_group_id]
  subnets            = ["${var.subnet-1a_id}", "${var.subnet-1c_id}"]

  enable_deletion_protection = true

  # TODO: ACCESS LOGS


}

# TODO: Listener & Routing
# resource "aws_alb_listener" "alb" {
#   load_balancer_arn = "${aws_alb.alb.arn}"
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2015-05"
#   certificate_arn   = "${var.alb_config["certificate_arn"]}"

#   default_action {
#     target_group_arn = "${aws_alb_target_group.alb.0.arn}"
#     type             = "forward"
#   }
# }

# ---------------------------------------------
# Target Group
# ---------------------------------------------
resource "aws_lb_target_group" "eilatsu-tg" {
  name     = "${var.service_name}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  # TODO: ALBとの連携

  health_check {
    interval = 30
    path = "/"
    port = 3000
    timeout = 5
    unhealthy_threshold = 5
    matcher             = 200
  }
}
