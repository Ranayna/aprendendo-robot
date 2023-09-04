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

# bloco onde insere as variaveis.  
*** Variables ***
${CAMPO_CARD}      id:form-botao 

# bloco onde se coloca os casos de testes
*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão criar card 
    Então sistema deve apresentar mensagem de campo obrigatório

# bloco onde se defini as palavras chaves
# Uma keyword é similar a uma função/método de uma linguagem de programação, onde recebemos parâmetros/argumentos e executamos/processamos algo.
# tem que estar no começo da linha
*** Keywords ***
Dado que eu clique no botão criar card
# Simula o clique de um elemento
    Click Element    ${CAMPO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório
# Verifica se o elemento identificado por locator está visível.
# Como só iremos usar esse locator uma vez não é necessario criar uma variavel
# O ID é do campo de nome
    Element Should Be Visible    id:form-nome-erro

# O ID é do campo de cargo
    Element Should Be Visible    id:form-cargo-erro

#  O ID é do campo de time
    Element Should Be Visible    id:form-times-erro

# Para rodar esse teste é necessario colocar no terminal: "robot preenchimento_incorreto.robot"