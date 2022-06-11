variable "ami_id"{
	default	= "ami-05ba3a39a75be1ec4"
}

variable "sg_id"{}
variable "ec2_name" {}

resource "aws_instance" "terraform_ec2_instance" {
	ami           			= "${var.ami_id}"
	instance_type 			= "t2.micro"
	vpc_security_group_ids	= ["${var.sg_id}"]
	tags = {
    Name = "${var.ec2_name}"
  }
}
