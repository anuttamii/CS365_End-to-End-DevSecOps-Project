resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.eksnode_group_name
  node_role_arn   = "arn:aws:iam::333732092862:role/LabRole"

  subnet_ids = [
    var.subnet_id_1,
    aws_subnet.public_subnet2.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3a.medium"]
  disk_size      = 20
}