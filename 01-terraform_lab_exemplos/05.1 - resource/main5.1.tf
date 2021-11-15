provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = "subnet-06efd40357f45eadf"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0995928404454422a"]
  key_name="itau-treinamento"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mamede-tf-01"
  }
}

output "instance_public" {
  value = [
            aws_instance.web.public_dns
          ]
  description = "Mostra os IPs publicos e privados da maquina criada."
}