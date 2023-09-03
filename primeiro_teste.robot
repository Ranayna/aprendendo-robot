#! dentro de settings iremos colocar todos os recursos necessários para executar os testes
#! como bibliotecas e links para arquivos com dados importantes.
*** Settings ***
#! biblioteca Selenium Library
#! Toda vez que formos passar um argumento ou parâmetro no Robot, é necessário usar ao menos dois espaços
Library   SeleniumLibrary

#! dentro de Variables se coloca as variaveis apara serem reutilizadas. 
*** Variables ***
#! sintaxe específica para declarar uma variável: ${}
#! Valor da variavel: colocado depois de dois espaços (o locator)
${URL}                    http://localhost:3000/
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao 
${PROGRAMACAO}     //option[contains(.,'Programação')]
${FRONT-END}       //option[contains(.,'Front-End')]
${DADOS}           //option[contains(.,'Data Science')]
${DEVOPS}          //option[contains(.,'Devops')]
${UX}              //option[contains(.,'UX e Design')]
${MOBILE}          //option[contains(.,'Mobile')]
${INOVACAO}        //option[contains(.,'Inovação')]

#todo: caso de teste. Aqui começamos a desenvolver os testes. 
*** Test Cases ***
#todo: Esta frase será o nome do primeiro cenário de teste
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    Dado que eu acesse o organo
    E preencha os campos do formulário
    E clique no botão criar card 
    Então identificar o card dentro do time esperado


#! bloco onde se pode definir palavras chaves para chamar executar vários passos de uma vez só.
#! Tem que estar bem no começo da linha
*** Keywords ***
Dado que eu acesse o organo
#! O robot permite somente usar palavras-chave
#! palavra-chave usada para abrir o navegador é "Open Browser"
#! É necessário configurar qual navegador o Robot deve abrir. Por padrão, ele opta pelo Firefox
#! Definiremos o parâmetro url e informaremos o endereço para acessar o Organo. 
    Open Browser     ${URL}                  browser=Chrome

E preencha os campos do formulário
#! "Input Text" deve preencher um campo de texto. As informações que precisamos passar são "Locator" e o "text"
#! "locator" é o elemento HTML que selecionaremos no painel de inspeção do navegador. 
#! O text é o dado com o qual preencheremos o campo.
    Input Text       ${CAMPO_NOME}            Akemi
    Input Text       ${CAMPO_CARGO}           Desenvolvedora
    Input Text       ${CAMPO_IMAGEM}          https://picsum.photos/200/300
#! O próximo elemento requer a seleção de um cargo de uma lista ( em vez de preencher um input, vamos clicar em um elemento e selecionar uma opção)
#! Click Element requer apenas o locator.
#! Não temos o ID, então usaremos a "class="lista-suspensa"" no lugar do locator.
    Click Element    ${CAMPO_TIME}
#! Usamos o Click Element mais uma vez para selecionar uma opção da lista.
#! Não temos nenhum ID e nenhuma classe para usar como locator de uma opção da lista!
#! Diante disso, é pedido ao Robot buscar um elemento option que contenha o termo "Programação"
#! A opção que contém o nome "Programação" e a que eu quero que ele procure. 
    Click Element    ${PROGRAMACAO}

E clique no botão criar card 
#! Após preencher e enviar o formulário, esperamos que a pessoa colaboradora seja adicionada ao time selecionado. 
    Click Element    ${CAMPO_CARD}

Então identificar o card dentro do time esperado
#! Element Should Be Visible (em português, "elemento deve estar visível"). Em resumo, se ele não aparecer na tela, mas estiver no código, o teste passará.
#! o Robot considera que o elemento pode estar visível tanto na interface quanto na parte lógica
#* Precisa já ter criado um card no organo!
    Element Should Be Visible    class:colaborador

#? Para que serve o sleep
#! No Robot, podemos usar a palavra-chave Sleep para rodar o teste mais lentamente, possibilitando o acompanhamento dos passos conforme sua execução.
#! Coloca também para mostrar clicando no botão
# Sleep    5s