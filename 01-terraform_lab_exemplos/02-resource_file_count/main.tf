resource "local_file" "teste" {
  count = 10
  filename = "aula-${count.index}.txt"
  content = "Olá alunos bem vindo ao terraform ${count.index}.0"
}

# count é como se fosse um looping  
# vai criar os arquivos começando com 0