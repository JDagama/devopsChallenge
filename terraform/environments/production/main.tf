module "iam" {
  source      = "../../modules/iam"
  cluster_name = "staging-cluster"
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "staging-cluster"
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_worker_role_arn
  subnet_ids      = local.subnet_ids
  vpc_id          = local.vpc_id
}

resource "kubectl_manifest" "calico" {
  yaml_body = file("${path.module}/calico.yaml")

  depends_on = [module.eks]
}