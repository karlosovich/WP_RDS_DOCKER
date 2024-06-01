#EC2
resource "aws_instance" "wordpress" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  key_name                    = "key_server_1"
  subnet_id                   = aws_subnet.public1.id
  security_groups             = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true

}


#rds subnet
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
}
#RDS INSTANCE
resource "aws_db_instance" "rds_instance" {
  engine                    = "mysql"
  engine_version            = "5.7"
  skip_final_snapshot       = true
  instance_class            = "db.t3.micro"
  allocated_storage         = 10
  identifier                = "my-rds-instance"
  db_name                   = "wordpress_db"
  username                  = "admin"
  password                  = "Asdf1234"
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids    = [aws_security_group.rds_security_group.id]

  tags = {
    Name = "RDS_instance"
  }
}

