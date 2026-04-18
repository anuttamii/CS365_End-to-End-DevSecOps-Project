# ========================
# EC2 Instance
# ========================
resource "aws_instance" "tetris_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"

  subnet_id              = var.subnet_id_1
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              
              # Install Docker
              yum install docker -y
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user

              # Run Tetris container
              docker run -d -p 80:80 \
              --name tetris \
              uzyexe/tetris
              EOF

  tags = {
    Name = "Tetris-EC2"
  }
}

# ========================
# Output
# ========================
output "tetris_url" {
  value = "http://${aws_instance.tetris_server.public_ip}"
}