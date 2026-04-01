# ========================
# CREATE SUBNET ใหม่
# ========================
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name2
  }
}

# ========================
# ROUTE TABLE
# ========================
resource "aws_route_table" "rt2" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.rt_name2
  }
}

# ========================
# ASSOCIATE ROUTE TABLE
# ========================
resource "aws_route_table_association" "rt_association2" {
  route_table_id = aws_route_table.rt2.id
  subnet_id      = aws_subnet.public_subnet2.id
}