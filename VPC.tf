# This file is used to create a VPC with 2 public and 2 private subnets in 2 different availability zones.

# vpc creation with cidr block
resource "aws_vpc" "wpApp-vpc" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name = "wpApp-vpc"
  }
}

#public subnet 1 in availability zone 1a
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.wpApp-vpc.id
  cidr_block = "10.100.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "wpApp-public-1-AZ1"
  }
}
# public subnet 2 in availability zone 1b
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.wpApp-vpc.id
  cidr_block = "10.100.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "wpApp-public-2-AZ2"
  }
}

#private subnet 1 in availability zone 1a
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.wpApp-vpc.id
  cidr_block = "10.100.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "wpApp-private-1-AZ1"
  }
}
# private subnet 2 in availability zone 1b
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.wpApp-vpc.id
  cidr_block = "10.100.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "wpApp-private-2-AZ2"
  }
}