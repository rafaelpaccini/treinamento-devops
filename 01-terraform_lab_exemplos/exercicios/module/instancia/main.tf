provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = "subnet-0a1df0373418387fe"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0427ac646dcc865ff"]
  key_name="itau-treinamento"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "${var.nome}"
  }
}
