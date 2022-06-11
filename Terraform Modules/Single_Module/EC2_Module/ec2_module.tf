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

variable "ami_id"{
	default	= "ami-05ba3a39a75be1ec4"
}

resource "aws_instance" "terraform_ec2_instance" {
	ami           			= "${var.ami_id}"
	instance_type 			= "t2.micro"
	vpc_security_group_ids	= ["${aws_security_group.terra_sg1.id}"]
	tags = {
    Name = "Terraform EC2 Instance"
  }
}

output "public_ip" {
	value       = aws_instance.terraform_ec2_instance.public_ip
	description = "The public IP of the web server"
}

output "security_group" {
	value	= aws_security_group.terra_sg1.id
}