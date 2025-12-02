# AWS Region Variable
variable "aws_region" {
  description = "AWS region jahan resources create honge"
  type        = string
  default     = "ap-south-1"
}

# EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance ka type, jaise t2.micro ya t3.small"
  type        = string
  default     = "t2.micro"
}

# Key Pair Name
variable "key_name" {
  description = "AWS key pair ka naam jo EC2 login ke liye use hoga"
  type        = string
  default     = "terraform-key"
}

# AMI ID
variable "ami_id" {
  description = "AMI ID (Amazon Machine Image) jisse EC2 instance launch hoga"
  type        = string
  default     = "ami-02b8269d5e85954ef"
}

# Security Group Name
variable "security_group_name" {
  description = "Security group ka naam jisme port rules define honge"
  type        = string
  default     = "terraform-ec2-sg"
}

# Instance Count (for count meta-argument)
variable "instance_count" {
  description = "Kitne EC2 instances create karne hain (count ke liye use hota hai)"
  type        = number
  default     = 3
}
