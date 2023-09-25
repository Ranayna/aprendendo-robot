# dentro de settings iremos colocar todos os recursos necessários para executar os testes
# como bibliotecas e links para arquivos com dados importantes.
#! O "Run Suite" serve para rodar todos os cenario dos testes, ele é a terceira forma de rodar os teste
#! A primeira é direto no terminal
#! A segunda é nas setas do "test cases"
*** Settings ***
# se estivesse em outro diretorio colocariamos o caminho completo (ex: ../diretorio/)
Resource        ../resources/main.robot
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



