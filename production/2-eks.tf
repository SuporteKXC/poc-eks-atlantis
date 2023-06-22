resource "aws_eks_cluster" "cluster" {
  name     = var.cluster-name
  version  = var.k8s-version
  role_arn = aws_iam_role.eks-cluster.arn

  vpc_config {

    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    security_group_ids = [aws_security_group.sg-cluster.id]

    subnet_ids  = [
      "subnet-0abc7b67550fa5405", "subnet-0f2f63e5e35cc5fd6", "subnet-053f9162875bff378"]
  }

  enabled_cluster_log_types = var.eks-cw-logging

  depends_on = [aws_iam_role_policy_attachment.amazon-eks-cluster-policy]
}
