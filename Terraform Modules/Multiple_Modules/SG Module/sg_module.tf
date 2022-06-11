variable "vpc_id"{
	type	= string
	default	= "vpc-0480c0ceff5a19d39"
}

resource "aws_security_group" "terra_sg1" {
  name        = "terra_sg1"
  description = "provisioning of aws services using terraform"
  vpc_id      = "${var.vpc_id}"

  ingress {
    description      = "allow inbound ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
}

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
}

  tags = {
    Name = "allow inbound & outbound ssh"
  }
}

output "security_group_output" {
	value	= aws_security_group.terra_sg1.id
}