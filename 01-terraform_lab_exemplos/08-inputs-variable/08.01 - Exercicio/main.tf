
 provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = "${var.subnet}"
  ami= "${var.ami}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg]
  key_name="itau-treinamento"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mamede-tf-01"
  }
}

# https://www.terraform.io/docs/language/values/outputs.html
output "dados" {
  value = [aws_instance.web.subnet_id,
           aws_instance.web.ami,
           aws_instance.web.vpc_security_group_ids,
           aws_instance.web.instance_type
          ]
  description = "Mostra os dados da maquina criada."
} 
