variable "ami" {
  type        = string
  description = "O id do Amazon Machine Image (AMI) para ser usado no servidor."

  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "O valor do image_id não é válido, tem que começar com \"ami-\"."
  }
}
variable "sg" {
  type        = string
  description = "O Security Group para ser usado no servidor."

  validation {
    condition     = length(var.sg) > 3 && substr(var.sg, 0, 3) == "sg-"
    error_message = "O valor do Security Group não é válido, tem que começar com \"sg-\"."
  }
}
variable "subnet" {
  type        = string
  description = "O id da Subnet para ser usado no servidor."

  validation {
    condition     = length(var.subnet) > 7 && substr(var.subnet, 0, 7) == "subnet-"
    error_message = "O valor do subnet não é válido, tem que começar com \"subnet-\"."
  }
}
variable "instance_type" {
  type        = string
  description = "O tipo de máquina para ser usado no servidor."

  validation {
    condition     = length(var.instance_type) > 3 && substr(var.instance_type, 0, 3) == "t2."
    error_message = "O valor do tipo de maquina não é válido, tem que começar com \"t2.\"."
  }
}