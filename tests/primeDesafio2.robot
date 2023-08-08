*** Settings ***
Resource            ../src/primeDesafio2KW.robot

*** Test Cases ***
CT001 - Exercício Dicionário
    [Documentation]    Exibir nome, idade, rua, numero, cep, bairro, cidade e estado no console a partir de um dicionário
    [Tags]             smoke    ex1
    Exibir dicionario 

CT002 - Exercício Argumentos e Retornos + If Simples
    [Documentation]    Criar uma keyword que receba idade e retorne o ano de nascimento
    ...                Se o ano for menor que 2000, exibir mensagem dizendo que nasceu no século passado
    [Tags]             smoke    ex2
    Verificar ${IDADE} da pessoa

CT003 - Exercício For Simples + Lista    
    [Documentation]    Exibir cada uma das frutas de uma lista usando um For Simples
    [Tags]             smoke    ex3
    Exibir lista de frutas


CT004 - Exercício If Inline + For in Range
    [Documentation]    Crie um loop que conte quantos números par existem entre 0 e 10, usando if inline
    [Tags]             smoke    ex4
    Verificar numeros pares

EXTRA - Exercício Try + Except + Finally
    [Documentation]    A partir da lista ["A", 1, "B", 2, "C" e 3], adicionar somente os números numa nova lista, 
    ...                tratar os caracteres como exceção e exibir a nova lista a cada iteração usando Finally.
    [Tags]             smoke    ex5
    Separar numeros da lista