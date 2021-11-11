provider "aws" {
  region = "sa-east-1"
}

module "criar_instancia" {
  source = "./instancia"
  nome = "ec2-mamede-terraform-module-01"
}

output "out" {
  value = [module.criar_instancia.public_dns] 

}