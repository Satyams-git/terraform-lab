# Key Pair Resource
resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file("mykey.pub")
}

# Security Group Resource
resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
     protocol   = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-EC2-SG"
  }
}

# EC2 Instance Resource
resource "aws_instance" "my_ec2" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = file("webscript.sh")

  tags = {
    Name = "Test_Instance_EC2"
  }
}

# Output
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_ec2[*].public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of EC2 instance"
  value       = aws_instance.my_ec2[*].public_dns
}
