# Essa página de cadastro vai funcionar como uma classe de tudo (irá se concentrar todos os elementos,
# E todas as funcionalidades/ações do teste)
# vamos concentrar todos os elementos, funcionalidades e ações da página. Isto é, vamos trazer as variáveis e keywords do projeto.

#! Aqui colocaremos as variaveis e as keywords
*** Settings ***
Resource    ../main.robot

# dentro de Variables se coloca as variaveis apara serem reutilizadas. 
*** Variables ***
#! Variaveis do preenchimento correto.
# sintaxe específica para declarar uma variável: ${}
# Valor da variavel: colocado depois de dois espaços (o locator)
${URL}             http://localhost:3000/
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao 
# Na sintaxe do Robot, criamos a lista digitando um @, abrindo chaves e inserindo entre elas o seu nome. 
@{selecionar_times}
# Para trazê-las, trocaremos o nome de cada variável por ...
# os seus valores serão sempre nomeados com ..., seguido de Tab(ou dois espaços) e o valor de sua posição na lista.
...        //option[contains(.,'Programação')]
...        //option[contains(.,'Front-End')]
...        //option[contains(.,'Data Science')]
...        //option[contains(.,'Devops')]
...        //option[contains(.,'UX e Design')]
...        //option[contains(.,'Mobile')]
...        //option[contains(.,'Inovação')]

# Com keywords podemos escrever conforme o que é usado em BDD e trazer uma melhor forma de compreender o que está acontecendo.
# bloco onde se pode definir palavras chaves para chamar executar vários passos de uma vez só.
# Tem que estar bem no começo da linha

*** Keywords ***
#! Keywords do preenchimento correto
Dado que preencha os campos do formulário
# "Input Text" deve preencher um campo de texto. As informações que precisamos passar são "Locator" e o "text"
# "locator" é o elemento HTML que selecionaremos no painel de inspeção do navegador. 
# O text é o dado com o qual preencheremos o campo.

# Quando se cria uma variavel local, ela só vai funcionar dentro daquele bloco de codigo, ou seja,
#  só vai funcionar aqui na keywords
# .First Name = cria um primeiro nome. 
    ${Nome}          FakerLibrary.First Name              
    Input Text       ${CAMPO_NOME}            ${Nome}
# .Job = cria um cargo
    ${Cargo}         FakerLibrary.Job        
    Input Text       ${CAMPO_CARGO}           ${Cargo}
#.Image Url = cria uma imagem aleatoria
#width=100: largura
# height=100: altura
    ${Imagem}        FakerLibrary.Image Url    width=100   height=100
    Input Text       ${CAMPO_IMAGEM}          ${Imagem}

# O próximo elemento requer a seleção de um cargo de uma lista ( em vez de preencher um input, vamos clicar em um elemento e selecionar uma opção)
# Click Element requer apenas o locator.
# Não temos o ID, então usaremos a "class="lista-suspensa"" no lugar do locator.
    Click Element    ${CAMPO_TIME}

# Usamos o Click Element mais uma vez para selecionar uma opção da lista.
# Não temos nenhum ID e nenhuma classe para usar como locator de uma opção da lista!
# Diante disso, é pedido ao Robot buscar um elemento option que contenha o termo "Programação"
# A opção que contém o nome "Programação" e a que eu quero que ele procure. 
# Como foi criado a lista de time a variavel "programação" não existe mais
# Sendo assim, é passado a lista ${selecionar_times} a ser percorrida junto da posição [0] que corresponde à opção "Programação".
    Click Element    ${selecionar_times}[0]

E clique no botão criar card 
# Após preencher e enviar o formulário, esperamos que a pessoa colaboradora seja adicionada ao time selecionado. 
    Click Element    ${CAMPO_CARD}

Então identificar 3 cards dentro do time esperado
# Element Should Be Visible (em português, "elemento deve estar visível"). Em resumo, se ele não aparecer na tela, mas estiver no código, o teste passará.
# o Robot considera que o elemento pode estar visível tanto na interface quanto na parte lógica
#* Precisa já ter criado um card no organo!
    Element Should Be Visible    class:colaborador
    
Então identificar 3 cards no time esperado
#Usamos um FOR ${1} IN RANGE: Sendo um laço que tem 2 contadores. 
# Vai começar do numero "1" e terminar no "3"
# Ele vai executar 3 vezes e encerrar no comando "END" no final. 
    FOR    ${i}    IN RANGE    1    3    
        Dado que preencha os campos do formulário
        E clique no botão criar card 
    END
# No Robot, podemos usar a palavra-chave Sleep para rodar o teste mais lentamente, possibilitando o acompanhamento dos passos conforme sua execução.
    Sleep    10s


Então criar e identificar 1 card em cada time disponível
# Este laço contará cada posição acessada e implementará o que queremos consoante ao objeto 
# desejado naquela posição, e passará para a linha de baixo. Ou seja, sempre serão considerados 
# o número e a posição para execução para baixar para a linha de baixo. 
# ${indice} = ele percorrerá o índice da lista e selecionará o elemento (element) conforme este critério.
# ${time} = o time da lista   
    FOR    ${index}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que preencha os campos do formulário
        # o locator que iremos passar é o time de acordo com a posição que ele se encontra
        Click Element    ${time}
        E clique no botão criar card
    END

    Sleep    10s
# Para rodar esse teste é necessario colocar no terminal:
# "robot preenchimento_correto.robot"


#! Keywords do preenchimento incorreto
# bloco onde se defini as palavras chaves
# Uma keyword é similar a uma função/método de uma linguagem de programação, onde recebemos parâmetros/argumentos e executamos/processamos algo.
# tem que estar no começo da linha

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