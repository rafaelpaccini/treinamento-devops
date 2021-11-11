resource "aws_vpc" "vpc-mamede-terraform-01" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-mamede-terraform-01"
  }
}

resource "aws_subnet" "sub-mamede-terraform-1a" {
  vpc_id            = aws_vpc.vpc-mamede-terraform-01.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "sub-mamede-terraform-1a"
  }
}

resource "aws_subnet" "sub-mamede-terraform-1b" {
  vpc_id            = aws_vpc.vpc-mamede-terraform-01.id
  cidr_block        = "10.0.40.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "sub-mamede-terraform-1b"
  }
}

resource "aws_subnet" "sub-mamede-terraform-1c" {
  vpc_id            = aws_vpc.vpc-mamede-terraform-01.id
  cidr_block        = "10.0.60.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "sub-mamede-terraform-1c"
  }
}

resource "aws_subnet" "sub-mamede-terraform-2a-private" {
  vpc_id            = aws_vpc.vpc-mamede-terraform-01.id
  cidr_block        = "10.0.80.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "sub-mamede-terraform-2a-private"
  }
}


resource "aws_internet_gateway" "gtw-mamede-terraform-01" {
  vpc_id = aws_vpc.vpc-mamede-terraform-01.id

  tags = {
    Name = "gtw-mamede-terraform-01"
  }
}

resource "aws_route_table" "rt-mamede-terraform-01" {
  vpc_id = aws_vpc.vpc-mamede-terraform-01.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = aws_internet_gateway.gtw-mamede-terraform-01.id
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "rt-mamede-terraform-01"
  }

}

resource "aws_route_table" "rt-mamede-terraform-02-private" {
  vpc_id = aws_vpc.vpc-mamede-terraform-01.id

  route = [
      
  ]
  tags = {
    Name = "rt-mamede-terraform-02-private"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-mamede-terraform-1a.id
  route_table_id = aws_route_table.rt-mamede-terraform-01.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sub-mamede-terraform-1b.id
  route_table_id = aws_route_table.rt-mamede-terraform-01.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.sub-mamede-terraform-1c.id
  route_table_id = aws_route_table.rt-mamede-terraform-01.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.sub-mamede-terraform-2a-private.id
  route_table_id = aws_route_table.rt-mamede-terraform-02-private.id
}
