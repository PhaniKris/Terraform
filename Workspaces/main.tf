provider "aws" {
	region	= "ap-south-1"
	profile	= "terra_lab"
}

module "sg_module" {
	sg_id	= "sg1_ec2_${local.env}"
	source	= "./SG Module"
}

module "ec2_module"{
	sg_id		= "${module.sg_module.security_group_output}"
	ec2_name	= "ec2_${local.env}"
	source		= "./EC2 Module"
}

locals {
	env	= "${terraform.workspace}"
}
