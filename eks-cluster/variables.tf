variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "cluster_name" {
  type    = string
  default = "satyam-eks-cluster"
}

variable "vpc_name" {
  type    = string
  default = "satyam-eks-vpc"
}

variable "node_group" {
  type = object({
    instance_type = string
    min_size      = number
    max_size      = number
    desired_size  = number
    capacity_type = string
  })

  default = {
    instance_type = "t2.medium"
    min_size      = 2
    max_size      = 3
    desired_size  = 3
    capacity_type = "SPOT"
  }
}
