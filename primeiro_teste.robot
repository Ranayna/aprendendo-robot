#! dentro de settings iremos colocar todos os recursos 

*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
Abrir navegador e acessar o site do organo
    Open Browser    url=http://localhost:3000/    browser=Chrome





