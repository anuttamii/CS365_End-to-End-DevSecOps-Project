resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster-name
  role_arn = "arn:aws:iam::333732092862:role/LabRole"

  vpc_config {
    subnet_ids = [
      var.subnet_id_1,
      aws_subnet.public-subnet2.id
    ]

    security_group_ids = [var.security_group_id]
  }

  version = "1.33"
}