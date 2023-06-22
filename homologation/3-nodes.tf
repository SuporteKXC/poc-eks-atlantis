resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.node-name
  node_role_arn   = aws_iam_role.nodes.arn

 subnet_ids  = [
   "subnet-0abc7b67550fa5405", "subnet-0f2f63e5e35cc5fd6", "subnet-053f9162875bff378"]

  capacity_type  = "ON_DEMAND"
  instance_types = []

  scaling_config {
    desired_size = var.desired-capacity
    max_size     = var.max-size
    min_size     = var.min-size
  }

  launch_template {
    name    = aws_launch_template.poc-atlantis.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "poc-atlantis"
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon-eks-worker-node-policy,
    aws_iam_role_policy_attachment.amazon-eks-cni-policy,
    aws_iam_role_policy_attachment.amazon-ec2-container-registry-read-only,
  ]

  # Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}

