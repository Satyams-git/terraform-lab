#Key Pair Resource

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file("mykey.pub")


}


#Security Group Resource

resource "aws_security_group" "ec2_sg" {
  name         = "terraform-ec2-sg"
  description  =  "Allow SSH and HTTP traffic"

 ingress {
   description  = "Allow SSH access"
   from_port    = 22
   to_port      = 22
   protocol     = "tcp"
   cidr_blocks  = ["0.0.0.0/0"]
}
 ingress {
  description = "Allow HTTP access"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

}
 ingress {
  description = "Allow HTTPS access"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
 egress {
 description  = "Allow all outbound traffic"
 from_port    = 0
 to_port      = 0
 protocol     = "-1"
 cidr_blocks  = ["0.0.0.0/0"]
 }
  tags        = {
  Name        = "Terraform-EC2-SG"
}
}

#EC2 Instance Resource
resource "aws_instance" "my_ec2" {
 ami           = var.ami_id
 for_each      = tomap ({
    Test-instance-1-micro  = "t2.micro"
    Test-instance-2-medium = "t2.medium"
})

 instance_type = each.value
 key_name      = aws_key_pair.my_key.key_name
 vpc_security_group_ids = [aws_security_group.ec2_sg.name]
 user_data              = file("webscript.sh")

tags = {
   Name = each.key
  }
}

#Output

output "ec2_public_ips" {
  description  = "Public IP of the EC2 instance"
  value        = { for name, inst in aws_instance.my_ec2 : name => inst.public_ip }
 }


