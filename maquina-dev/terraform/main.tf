provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "dev" {
  subnet_id     = aws_subnet.sub-dev.id
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.xlarge"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.sg-dev.id}"]
  key_name="itau-treinamento"
  root_block_device {
    encrypted = true    
    volume_size = 30
  }
  tags = {
    Name = "ec2-mamede-dev-01"
  }
}

output "instance_public" {
  value = [
            aws_instance.web.public_dns,
            aws_instance.web.public_ip
          ]
  description = "Mostra os IPs publicos e privados da maquina criada."
}