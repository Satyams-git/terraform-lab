terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "satyam-teraform-states-ap-south-1"
    key            = "eks/cluster/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-lock-table"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
