output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster.arn
}

output "eks_worker_role_arn" {
  value = aws_iam_role.eks_workers.arn
}