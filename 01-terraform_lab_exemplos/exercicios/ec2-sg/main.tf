
 provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  count = 3
  subnet_id     = "subnet-0117bc7c199225a33"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name="itau-treinamento"
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mamede-tf-${(count.index+1)}"
  }
}

# https://www.terraform.io/docs/language/values/outputs.html
output "instance_public" {
  value = [
            for key, item in aws_instance.web:
            "ssh -i ~/aws/key01 ubuntu@${item.public_dns}"
          ]
  description = "Mostra os IPs publicos e privados da maquina criada."
}