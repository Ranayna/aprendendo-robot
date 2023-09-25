*** Settings ***
# biblioteca Selenium Library
# Toda vez que formos passar um argumento ou parâmetro no Robot, é necessário usar ao menos dois espaços
Library         SeleniumLibrary

# Library que tem como função fazer a massa de dados e criar nome, cargos e etc fakes. 
# Podemos configurar os dados vindos da FakerLibrary conforme o formato desejado. 
# Precisamos de dados do Brasil: nomes brasileiros e cargos que existem aqui 
# (e também seria o caso para outros tipos de dados como CEP, endereços, etc.). Para isso é necessario usar o "locale=pt_BR"
# Fazendo essa configuração em Settings não será necessario corrigir depois. Essa configuração é bem util para quando tiver usando CEP e CPF por exemplo. 
Library        FakerLibrary    locale=pt_BR

# O main já está dentro da ásta resources, não é necessario colocar os dois ponto (um para sair e outro para adentrar na outra pasta)
Resource   shared/setup_teardown.robot
Resource   pages/cadastro.robot     