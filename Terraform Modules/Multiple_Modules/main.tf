provider "aws" {
	region	= "ap-south-1"
	profile	= "terra_lab"
}

module "sg_module" {
	source	= "./SG Module"
}

module "ec2_module"{
	sg_id	= "${module.sg_module.security_group_output}"
	ec2_name= "ec2 using modules"
	source	= "./EC2 Module"
}
