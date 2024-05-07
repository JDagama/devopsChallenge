output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_token" {
  value = aws_eks_cluster.this.token
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.this.certificate_authority.0.data
}

output "node_group_statuses" {
  value = { for ng in aws_eks_node_group.this : ng.node_group_name => ng.status }
}