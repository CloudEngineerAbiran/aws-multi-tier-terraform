# ================================
# VPC Configuration
# ================================
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# ================================
# Public Subnet
# ================================
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
}

# ================================
# Private Subnet
# ================================
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
}

# ================================
# Internet Gateway (IGW)
# ================================
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# ================================
# Route Table for Public Subnet
# ================================
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
}

# ================================
# Route to Internet Gateway
# ================================
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# ================================
# Associate Route Table with Public Subnet
# ================================
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# ================================
# Security Group (Web Server)
# ================================
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id

  # Allow inbound SSH (22) access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound HTTP (80) access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ================================
# EC2 Instance
# ================================
resource "aws_instance" "web" {
  ami                    = "ami-localstack" # Dummy AMI for LocalStack
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  depends_on = [aws_security_group.web_sg] # Ensures SG is created before instance

  tags = {
    Name = "web-instance"
  }
}

