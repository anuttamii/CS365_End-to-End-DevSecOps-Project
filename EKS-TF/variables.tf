variable "cluster_name" {}
variable "eksnode_group_name" {}

variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "subnet_id_1" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_name2" {
  type = string
}

variable "rt_name2" {
  type = string
}