resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-mamede-dev-01"
  }
}

resource "aws_subnet" "sub-dev" {
  vpc_id            = aws_vpc.vpc-dev.id
  cidr_block        = "10.0.60.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "sub-mamede-dev-01"
  }
}


resource "aws_internet_gateway" "gtw-dev" {
  vpc_id = aws_vpc.vpc-dev.id

  tags = {
    Name = "gtw-mamede-dev-01"
  }
}

resource "aws_route_table" "rt-dev" {
  vpc_id = aws_vpc.vpc-dev.id

  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = aws_internet_gateway.gtw-dev.id
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
    Name = "rt-mamede-dev-01"
  }

}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-dev.id
  route_table_id = aws_route_table.rt-dev.id
}

