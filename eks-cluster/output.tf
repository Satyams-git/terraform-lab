output "cluster_name" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "worker_node_group_role" {
  value = module.eks.eks_managed_node_groups
}

output "kubeconfig_command" {
  value = {
    region     = var.region
    cluster_id = module.eks.cluster_id
    command    = module.eks.cluster_id == null ? "" : "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_id}"
  }
}

