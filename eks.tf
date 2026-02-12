module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.34"

  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  cluster_endpoint_public_access = true

  enable_irsa = true

  eks_managed_node_groups = {
    notes_nodes = {
      instance_types = ["t3.small"]

      min_size     = 3
      max_size     = 5
      desired_size = 3

      disk_size = 15

      ami_type      = "AL2023_x86_64_STANDARD"
      capacity_type = "ON_DEMAND"

      tags = {
        Name = "notes-app-nodes"
      }
    }
  }

  cluster_addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent = true
    }

    aws-ebs-csi-driver = {
      most_recent              = true
      service_account_role_arn = module.ebs_csi_irsa_role.iam_role_arn
    }
    
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
