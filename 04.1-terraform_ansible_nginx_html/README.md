# rodar playbook no ansible
ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/aws/key01

# acesso ssh maquina
ssh -i ~/aws/key01 ubuntu@ec2-18-230-76-190.sa-east-1.compute.amazonaws.com
