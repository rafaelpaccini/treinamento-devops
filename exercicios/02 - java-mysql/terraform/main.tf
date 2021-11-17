provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = aws_subnet.sub-exerc.id
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.sg-exerc.id}"]
  key_name="itau-treinamento"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mamede-tf-java-01"
  }
}

output "instance_public" {
  value = [
            aws_instance.web.public_dns,
            aws_instance.web.public_ip
          ]
  description = "Mostra os IPs publicos e privados da maquina criada."
}