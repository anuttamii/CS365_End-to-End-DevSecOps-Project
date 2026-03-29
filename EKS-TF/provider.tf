provider "aws" {
  region = "us-east-1"

  # ใช้ LabRole แทน voclabs (สำคัญมาก)
  assume_role {
    role_arn = "arn:aws:iam::333732092862:role/LabRole"
  }
}