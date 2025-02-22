provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
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
    Name = "ec2-mamede-tf"
  }
}

# https://www.terraform.io/docs/language/values/outputs.html
output "instance_public_dns" {
  value = [aws_instance.web.public_dns, 
  aws_instance.web.public_ip,
  "ssh -i ~/aws/key01 ubuntu@${aws_instance.web.public_dns}"]
  description = "Mostra os IPs publicos e privados da maquina criada."
}