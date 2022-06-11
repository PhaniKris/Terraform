provider "aws" {
	region	= "ap-south-1"
	profile	= "terra_lab"
}

module "ec2_module"{
	source	= "./EC2_Module"
}