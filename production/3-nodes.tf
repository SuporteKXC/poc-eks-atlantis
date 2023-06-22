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
    name    = aws_launch_template.freterapido-prod.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "freterapido"
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

#######3DATABASE

resource "aws_eks_node_group" "eks-node-group-database" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "database"
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
    name    = aws_launch_template.database.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "database"
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

####application

resource "aws_eks_node_group" "eks-node-group-application" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "application"
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
    name    = aws_launch_template.application.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "application"
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

### quote
resource "aws_eks_node_group" "eks-node-group-quote" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "quote"
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
    name    = aws_launch_template.quote.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "quote"
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

### workers

resource "aws_eks_node_group" "eks-node-group-workers" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "workers"
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
    name    = aws_launch_template.workers.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "workers"
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

####web

resource "aws_eks_node_group" "eks-node-group-web" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "web"
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
    name    = aws_launch_template.web.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "web"
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


####worker-import

resource "aws_eks_node_group" "eks-node-group-worker-import-quote-table" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "worker-import-quote-table"
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
    name    = aws_launch_template.worker-import-quote-table.name
    version = "1"
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "worker-import-quote-table"
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
