provider "aws" {
	region	= "ap-south-1"
	profile	= "terra_lab"
}
///////////////////*****************************************************
// variable types
//STRINGS

variable "myfirststring"{
	type	= string
	default	= "this is my first string"
}

output "StringOutput"{
	value	= "${var.myfirststring}"
}
///////////////////////////////////
variable "multilinestring"{
	type	= string
	default	= <<EOH
	this is
	multi
	line
	string.
	EOH
}

output "MultilineStringOutput"{
	value	= "${var.multilinestring}"
}
///////////////////*****************************************************
//MAPS

variable "maps"{
	default	= {
		"us-east"	= "ami-1"
		"us-west"	= "ami-2"
	}
}

output "maps_output"{
	value= "${var.maps["us-east"]}"
}
/////OR//////
variable "maps_2"{
	default	= {
		"us-east"	= "ami-1"
		"us-west"	= "ami-2"
	}
}

output "maps_output_2"{
	value= "${var.maps_2}"
}
///////////////////*****************************************************
//LISTS

variable "lists"{
	type	= list
	default	= ["sg1", "sg2", "sg3"]
}

output "lists_output"{
	value	= "${var.lists[1]}"
}
/////OR//////
variable "lists_2"{
	type	= list
	default	= ["sg1", "sg2", "sg3"]
}

output "lists_output_2"{
	value	= "${var.lists_2}"
}
///////////////////*****************************************************
//BOOLEAN

variable "bool"{
	default	= true
}

output "bool_output"{
	value	= "${var.bool}"
}
/////OR//////
variable "bool_2"{
	default	= "true"
}

output "bool_output_2"{
	value	= "${var.bool_2}"
}
///////////////////////////////////
variable "bool_3"{
	default	= false
}

output "bool_output_3"{
	value	= "${var.bool_3}"
}
/////OR//////
variable "bool_4"{
	default	= "false"
}

output "bool_output_4"{
	value	= "${var.bool_4}"
}

///////////////////*****************************************************
//Input & Output Variables

variable "input"{
	type	= string
}

output "input_output"{
	value	= "${var.input}"
}
///////////if the output contains sensitive information and it should not visible to the person executing the code to see the output
variable "input_2"{
	type	= string
}

output "input_output_2"{
	sensitive	= true
	value		= "${var.input_2}"
}