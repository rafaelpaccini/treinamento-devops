# Maquina de DEV para trabalho

Após rodar o terraform

## executar os comandos de instalacao 
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl ansible net-tools nmap

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install terraform

sudo apt install awscli -y

mkdir ~/.aws

## Configurar AWS CLI

aws configure
pegar key e password no .aws/credentials do notebook

## clone projeto github
git clone https://github.com/rafaelpaccini/treinamento-devops.git

## scp da chave
scp -r -i "/c/Users/rafae/aws/key01" '/c/Users/rafae/aws/key01' ubuntu@54.233.241.59:/home/ubuntu

