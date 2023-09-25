# dentro de settings iremos colocar todos os recursos necessários para executar os testes
# como bibliotecas e links para arquivos com dados importantes.

*** Settings ***

#Para acessar o arquivo passamos o resource
Resource        ../resources/main.robot
# Essa ação vai acontecer toda vez que iniciar o teste
Test Setup        Dado que eu acesse o organo
# Essa ação vai acontecer toda vez que iniciar o teste
Test Teardown     Fechar o navegaor

# bloco onde insere as variaveis.  
*** Variables ***
${CAMPO_CARD}      id:form-botao 

# bloco onde se coloca os casos de testes
*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão criar card 
    Então sistema deve apresentar mensagem de campo obrigatório

