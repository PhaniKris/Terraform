provider "aws"{
	region	= "ap-south-1"
	profile	= "terra_lab"
}

resource "aws_s3_bucket" "bucket-29-04"{
	bucket	= "bucket-29-04"
}

resource "aws_s3_bucket_acl" "bucket-29-04" {
	bucket	= aws_s3_bucket.bucket-29-04.id
//	acl		= "public-read"
	acl		= "private"
}

resource "aws_s3_object" "my-s3-upload"{
	bucket	= aws_s3_bucket.bucket-29-04.id
	key		= "image-1"
	acl		= "public-read"
	source	= "C:/Users/MATTA PHANI KRISHNA/Downloads/Phani signature.jpg"
}
