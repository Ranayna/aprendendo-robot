#! dentro de settings iremos colocar todos os recursos necessários para executar os testes
#! como bibliotecas e links para arquivos com dados importantes.
*** Settings ***
#! biblioteca Selenium Library
#! Toda vez que formos passar um argumento ou parâmetro no Robot, é necessário usar ao menos dois espaços
Library   SeleniumLibrary

#todo: caso de teste. Aqui começamos a desenvolver os testes. 
*** Test Cases ***
#todo: Esta frase será o nome do primeiro cenário de teste
Abrir navegador e acessar o site do organo
#! O robot permite somente usar palavras-chave
#! palavra-chave usada para abrir o navegador é "Open Browser"
#! É necessário configurar qual navegador o Robot deve abrir. Por padrão, ele opta pelo Firefox
#! Definiremos o parâmetro url e informaremos o endereço para acessar o Organo. 
    Open Browser    url=http://localhost:3000/    browser=Chrome

#todo: Esta frase será o nome do segundo cenário de teste
#todo: Esse teste deve preencher os campos do formulário, enviá-lo e conferir se a pessoa colaboradora é adicionada como esperado
Preencher os campos do formulário
#! "Input Text" deve preencher um campo de texto. As informações que precisamos passar são "Locator" e o "text"
#! "locator" é o elemento HTML que selecionaremos no painel de inspeção do navegador. 
#! O text é o dado com o qual preencheremos o campo.
    Input Text       id:form-nome            Akemi
    Input Text       id:form-cargo           Desenvolvedora
    Input Text       id:form-imagem          https://picsum.photos/200/300
#! O próximo elemento requer a seleção de um cargo de uma lista ( em vez de preencher um input, vamos clicar em um elemento e selecionar uma opção)
#! Click Element requer apenas o locator.
#! Não temos o ID, então usaremos a "class="lista-suspensa""" no lugar do locator.
    Click Element    class:lista-suspensa
#! Usamos o Click Element mais uma vez para selecionar uma opção da lista.
#! Não temos nenhum ID e nenhuma classe para usar como locator de uma opção da lista!
#! Diante disso, é pedido ao Robot buscar um elemento option que contenha o termo "Programação"
#! A opção que contém o nome "Programação" e a que eu quero que ele procure. 
    Click Element    //option[contains(.,'Programação')]