resource "aws_route_table" "public-subnet-in-us-east-1" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "Linoxide Public Subnet"
  }
}

resource "aws_route_table_association" "public-subnet-in-us-east-1-association" {
  subnet_id      = "${aws_subnet.public-subnet-in-us-east-1.id}"
  route_table_id = "${aws_route_table.public-subnet-in-us-east-1.id}"
}

resource "aws_route_table" "private-subnet-us-east-1" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }

  tags {
    Name = "Linoxide Private Subnet"
  }
}

resource "aws_route_table_association" "private-subnet-us-east-1-association" {
  subnet_id      = "${aws_subnet.private-subnet-us-east-1.id}"
  route_table_id = "${aws_route_table.private-subnet-us-east-1.id}"
}
