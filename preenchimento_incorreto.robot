# dentro de settings iremos colocar todos os recursos necessários para executar os testes
# como bibliotecas e links para arquivos com dados importantes.

*** Settings ***
Library           SeleniumLibrary
#Para acessar o arquivo passamos o resource
Resource          setup_teardown.robot
# Essa ação vai acontecer toda vez que iniciar o teste
Test Setup        Dado que eu acesse o organo
# Essa ação vai acontecer toda vez que iniciar o teste
Test Teardown     Fechar o navegaor


*** Variables ***


*** Test Cases ***


*** Keywords ***