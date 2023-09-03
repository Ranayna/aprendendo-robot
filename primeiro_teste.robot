#! dentro de settings iremos colocar todos os recursos necessários para executar os testes
#! como bibliotecas e links para arquivos com dados importantes.
*** Settings ***
#! biblioteca Selenium Library
#! Toda vez que formos passar um argumento ou parâmetro no Robot, é necessário usar ao menos dois espaços
Library   SeleniumLibrary

#! caso de teste. Aqui começamos a desenvolver os testes. 
*** Test Cases ***
#! Esta frase será o nome do nosso primeiro cenário de teste
Abrir navegador e acessar o site do organo
#! O robot permite somente usar palavras-chave
#! palavra-chave usada para abrir o navegador é "Open Browser"
#! É necessário configurar qual navegador o Robot deve abrir. Por padrão, ele opta pelo Firefox
#! Definiremos o parâmetro url e informaremos o endereço para acessar o Organo. 
    Open Browser    url=http://localhost:3000/    browser=Chrome





