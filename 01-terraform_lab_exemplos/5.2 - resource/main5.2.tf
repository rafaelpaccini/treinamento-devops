provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  for_each = toset(["mamede-10","mamede-20","mamede-30"])
  subnet_id     = "subnet-0117bc7c199225a33"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-08e75f959ab66a309"]
  key_name="itau-treinamento"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-${each.key}"
  }
}