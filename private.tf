resource "aws_subnet" "private-subnet-us-east-1" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    Name = "Linoxide Private Subnet"
  }
}
