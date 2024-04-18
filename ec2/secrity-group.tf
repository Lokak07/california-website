module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "explore-california-security-eks"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
}

resource "aws_security_group_rule" "http_ingress" {
  security_group_id = module.web_server_sg.security_group_id
  type             = "ingress"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  description      = "HTTP"
}

resource "aws_security_group_rule" "custom_http_ingress" {
  security_group_id = module.web_server_sg.security_group_id
  type             = "ingress"
  from_port        = 8080
  to_port          = 8080
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  description      = "Custom HTTP port"
}

resource "aws_security_group_rule" "ssh_ingress" {
  security_group_id = module.web_server_sg.security_group_id
  type             = "ingress"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  description      = "SSH"
}
