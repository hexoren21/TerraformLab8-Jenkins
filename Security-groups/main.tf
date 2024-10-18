variable "ec2_sg_name" {}
variable "vpc_id" {}
variable "ec2_jenkins_sg_name" {}
variable "ip_address" {}
variable "lb_sg_name" {}
variable "ec2_sonarqube_sg_name" {}

output "sg_ec2_sg_ssh_http_id" {
    value = aws_security_group.ec2_sg_ssh_http.id
}

output "sg_ec2_jenkins_port_8080" {
    value = aws_security_group.ec2_jenkins_port_8080.id
}

output "lb_sg_ssh_http_id" {
    value = aws_security_group.lb_sg_ssh_http.id
}

output "sg_ec2_sonarqube_id" {
    value = aws_security_group.ec2_sonarqube.id
}


resource "aws_security_group" "ec2_sg_ssh_http" {
  name        = var.ec2_sg_name
  description = "Enable the Port 22(SSH) & Port 80(http)"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow remote SSH from my ip"
    cidr_blocks = [var.ip_address]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # enable http
  ingress {
    description = "Allow HTTP request from my ip"
    cidr_blocks = [var.ip_address]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    description = "Allow HTTP request from lb"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = [aws_security_group.lb_sg_ssh_http.id]
  }


  # enable http
  ingress {
    description = "Allow HTTP request from ip"
    cidr_blocks = [var.ip_address]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  #Outgoing request
  egress {
    description = "Allow outgoing request"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Groups to allow SSH(22) and HTTP(80)"
  }
}

resource "aws_security_group" "ec2_jenkins_port_8080" {
  name        = var.ec2_jenkins_sg_name
  description = "Enable the Port 8080 for jenkins"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow 8080 port to access jenkins"
    cidr_blocks = [var.ip_address]
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
  }

  tags = {
       Name = "Security Groups to allow SSH(22) and HTTP(80)"
  }
}

resource "aws_security_group" "lb_sg_ssh_http" {
  name        = var.lb_sg_name
  description = "Enable the Port 80 and 443 for lb"
  vpc_id      = var.vpc_id

  # enable http
  ingress {
    description = "Allow HTTP request from my ip"
    cidr_blocks = [var.ip_address]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  # enable http
  ingress {
    description = "Allow HTTP request from ip"
    cidr_blocks = [var.ip_address]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  #Outgoing request
  egress {
    description = "Allow outgoing request"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Groups lb to allow HTTP(80) and HTTPS(443)"
  }
}

resource "aws_security_group" "ec2_sonarqube" {
  name        = var.ec2_sonarqube_sg_name
  description = "Enable the Port for sonarqube"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow 22 port to access sonarqube"
    cidr_blocks = [var.ip_address]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

   ingress {
    description = "Allow 80 port to access sonarqube"
    cidr_blocks = [var.ip_address]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    description = "Allow 9000 port to access sonarqube"
    cidr_blocks = [var.ip_address]
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
  }

    #Outgoing request
  egress {
    description = "Allow outgoing request"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
       Name = "Security Groups to allow SSH(22) and HTTP(80) HTTP(9000)"
  }
}