resource "aws_vpc" "vpc-exerc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames=true
  tags = {
    Name = "vpc-mamede-tf-bootstrap-01"
  }
}

resource "aws_subnet" "sub-exerc" {
  vpc_id            = aws_vpc.vpc-exerc.id
  cidr_block        = "10.0.60.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "sub-mamede-tf-bootstrap-1a"
  }
}


resource "aws_internet_gateway" "gtw-exerc" {
  vpc_id = aws_vpc.vpc-exerc.id

  tags = {
    Name = "gtw-mamede-tf-bootstrap-01"
  }
}

resource "aws_route_table" "rt-exerc" {
  vpc_id = aws_vpc.vpc-exerc.id

  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = aws_internet_gateway.gtw-exerc.id
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
    Name = "rt-mamede-tf-bootstrap-01"
  }

}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-exerc.id
  route_table_id = aws_route_table.rt-exerc.id
}

