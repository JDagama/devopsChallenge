provider "aws" {
  region = "us-west-2" 
  profile = "jagama-staging"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = module.eks.cluster_token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  token                  = module.eks.cluster_token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  load_config_file       = false
}