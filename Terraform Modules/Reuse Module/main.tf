provider "aws" {
	region	= "ap-south-1"
	profile	= "terra_lab"
}

module "sg_module" {
	source	= "./SG Module"
}

module "ec2_module_1"{
	sg_id	= "${module.sg_module.security_group_output}"
	ec2_name= "ec2-reuse1"
	source	= "./EC2 Module"
}

module "ec2_module_2"{
	sg_id	= "${module.sg_module.security_group_output}"
	ec2_name= "ec2-reuse2"
	source	= "./EC2 Module"
}
