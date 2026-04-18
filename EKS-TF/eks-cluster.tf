resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = "arn:aws:iam::140891077762:role/LabRole"

  vpc_config {
    subnet_ids = [
      var.subnet_id_1,
      aws_subnet.public_subnet2.id
    ]

    security_group_ids = [var.security_group_id]
  }

  version = "1.33"
}