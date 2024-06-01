#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wpApp-vpc.id

  tags = {
    Name = "wpApp-igw"
  }
}

#elastic ip address for nat gateway
resource "aws_eip" "eip" {
  instance = aws_instance.wordpress.id
}

#nat gateway
resource "aws_nat_gateway" "nat" {
  connectivity_type = "private" # to fix eip allocation error
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "wpApp-nat"
  }
}
