#AWS Region Variable


variable "aws_region" {
 description  = "AWS Region Where aour resources will get created"
 type         = string
 default      = "ap-south-1"

}


#EC2 Instance Type

variable "instance_type" {
 description  = "EC2 Instance type"
 type         = string
 default      = "t2.micro"

}


#Key Pair Name

variable "key_name" {
 description  = "Key pair name for EC2 login"
 type         = string
 default      = "terraform-key"

}

#AMI ID

variable "ami_id" {
 description = "AMI ID for Ec2 instance"
 type        = string
 default     = "ami-02b8269d5e85954ef"
}

#Security Group Name

variable "security_group_name" {
 description  = "Name of the security group"
 type         = string
 default      = "terraform-ec2-sg"
}


#Variable for for_each
variable "instances" {
 description = "Map of instance name => instance_type"
 type        = map(string)
 default     = {
   "Test-instance-1-micro"   = "t2.micro"
   "Test-instance-2-medium"  = "t2.medium"
 }
}
