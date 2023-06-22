
resource "aws_security_group" "sg-cluster" {
  description = "cluster eks sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks     = ["0.0.0.0/0"]
    from_port       = "0"
    protocol        = "tcp"
    self            = "false"
    to_port         = "65535"
  }

  name = "SG_cluster_eks_${var.cluster-name}"

  tags = {
    Name = "SG_cluster_eks_${var.cluster-name}"
  }


  vpc_id = "vpc-04b0a5e7789188d46"
}


###SG NODE

resource "aws_security_group" "sg-node" {
  description = "node eks sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks     = ["0.0.0.0/0"]
    from_port       = "0"
    protocol        = "tcp"
    self            = "false"
    to_port         = "65535"
  }

  name = "SG_node_eks_${var.node-name }"

  tags = {
    Name = "SG_node_eks_${var.node-name }"
  }


  vpc_id = "vpc-04b0a5e7789188d46"
}
