/*resource "aws_vpc" "terraform-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = "true"
  instance_tenancy     = "default"
  assign_generated_ipv6_cidr_block = true
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "public-subnet-1" {
  cidr_block        = var.public_subnet_1_cidr
  vpc_id            = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = "true"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc.ipv6_cidr_block, 8, 1)}"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SubNet-1a-pub-${var.vpc-name}"
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block        = var.public_subnet_2_cidr
  vpc_id            = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = "true"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc.ipv6_cidr_block, 8, 2)}"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SubNet-1b-pub-${var.vpc-name}"
  }
}

resource "aws_subnet" "public-subnet-3" {
  cidr_block        = var.public_subnet_3_cidr
  vpc_id            = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = "true"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc.ipv6_cidr_block, 8, 3)}"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SubNet-1c-pub-${var.vpc-name}"
  }
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block        = var.private_subnet_1_cidr
  vpc_id            = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}a"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc.ipv6_cidr_block, 8, 4)}"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SubNet-1a-priv-${var.vpc-name}"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block        = var.private_subnet_2_cidr
  vpc_id            = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}b"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc.ipv6_cidr_block, 8, 5)}"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SubNet-1b-priv-${var.vpc-name}"
  }
}

resource "aws_subnet" "private-subnet-3" {
  cidr_block        = var.private_subnet_3_cidr
  vpc_id            = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}c"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.terraform-vpc.ipv6_cidr_block, 8, 6)}"
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SubNet-1c-priv-${var.vpc-name}"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "rt-pub-${var.vpc-name}"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "rt-priv-${var.vpc-name}"
  }
}

resource "aws_route_table_association" "public-route-1-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "public-route-2-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-2.id
}

resource "aws_route_table_association" "public-route-3-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id      = aws_subnet.public-subnet-3.id
}

resource "aws_route_table_association" "private-route-1-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-1.id
}

resource "aws_route_table_association" "private-route-2-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-2.id
}

resource "aws_route_table_association" "private-route-3-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id      = aws_subnet.private-subnet-3.id
}

resource "aws_eip" "elastic-ip-for-nat-gw" {
  vpc                       = true
  associate_with_private_ip = "34.233.41.253"

  tags = {
    Name = "elastic-nat-${var.vpc-name}"
  }

  depends_on = [aws_internet_gateway.terraform-igw]
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.elastic-ip-for-nat-gw.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "nat-${var.vpc-name}"
  }

  depends_on = [aws_eip.elastic-ip-for-nat-gw]
}

resource "aws_route" "nat-gw-route" {
  route_table_id         = aws_route_table.private-route-table.id
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
  destination_cidr_block = "0.0.0.0/0"
}


resource "aws_internet_gateway" "terraform-igw" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "igw-${var.vpc-name}"
  }
}

resource "aws_route" "public-internet-igw-route" {
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.terraform-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "egw-route-private" {
  route_table_id              = aws_route_table.private-route-table.id
  egress_only_gateway_id      = aws_egress_only_internet_gateway.egw.id
  destination_ipv6_cidr_block = "::/0"
}

resource "aws_route" "egw-route-public" {
  route_table_id              = aws_route_table.public-route-table.id
  egress_only_gateway_id      = aws_egress_only_internet_gateway.egw.id
  destination_ipv6_cidr_block = "::/0"
}

resource "aws_egress_only_internet_gateway" "egw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "egw-${var.vpc-name}"
  }
}

*/