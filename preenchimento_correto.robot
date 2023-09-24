# dentro de settings iremos colocar todos os recursos necessários para executar os testes
# como bibliotecas e links para arquivos com dados importantes.

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

# insere aqui o caminho para acessar o arquivo "setup_teardown"
# se estivesse em outro diretorio colocariamos o caminho completo (ex: ../diretorio/)
Resource        setup_teardown.robot

# permite que o padrão de acontecimento se repita no início de cada teste. 
# toda vez que ele iniciar, ele vai ter que voltar de novo.
# Essa ação irá se repetir toda vez que iniciar o teste 
Test Setup      Dado que eu acesse o organo

# Essa ação vai acontecer toda vez que iniciar o teste
Test Teardown   Fechar o navegaor


# caso de teste. Aqui começamos a desenvolver os testes. 
*** Test Cases ***
# Esta frase será o nome do primeiro cenário de teste
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    
    Dado que preencha os campos do formulário
    E clique no botão criar card 
    Então identificar 3 cards dentro do time esperado

Verificar se é possível criar mais de um card se preenchermos os campos corretamente
# Esse teste vai se repetir os mesmos passos de antes, mas ele vai rodar algumas vezes. 
    Dado que preencha os campos do formulário    
    E clique no botão criar card
    Então identificar 3 cards no time esperado

Verificar se é possível criar um card para cada time disponível se preenchermos os campos corretamente 
    Dado que preencha os campos do formulário
    Então criar e identificar 1 card em cada time disponível 



