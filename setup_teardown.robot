# padrão de iniciação
*** Settings ***
Library   SeleniumLibrary


# O robot permite somente usar palavras-chave
*** Keywords ***
Dado que eu acesse o organo
# palavra-chave usada para abrir o navegador é "Open Browser"
# É necessário configurar qual navegador o Robot deve abrir. Por padrão, ele opta pelo Firefox
# Definiremos o parâmetro url e informaremos o endereço para acessar o Organo. 
    Open Browser     url=http://localhost:3000/                 browser=Chrome

Fechar o navegaor 
# O close browser fecha o browser
    Close Browser