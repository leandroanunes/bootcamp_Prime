####################################################################################################
# Name:           primeDesafio2KW.robot
# Description:    Keywords para automação de testes
# Project:        Prime Hero Academy
# Author:         Leandro Nunes - leandroaraujo120803@gmail.com
####################################################################################################

*** Settings ***
Resource               ./primeVariables.robot

Library                SeleniumLibrary
Library                Collections

*** Keywords ***
Exibir dicionario
    # Exibir um dicionario com informações de uma pessoa
    FOR    ${PESSOA}    IN    &{PESSOA}
        Log To Console    ${PESSOA}
    END

Verificar ${IDADE} da pessoa
    # Calcular a o ano que a pessoa nasceu (contando que estamos em 2023)
    ${DATA_NASC}     Evaluate    ${ANO_ATUAL} - ${IDADE}  
    
    # Verifica se a pessoa nasceu antes ou depois de 2000
    IF    ${DATA_NASC} < ${ANO2000}
        Log To Console    "nasceu antes de 2000"    # para exibir no console
        Log               "nasceu antes de 2000"    # para exibir no report
    ELSE    
        Log To Console    "nasceu depois de 2000"    # para exibir no console
        Log               "nasceu depois de 2000"    # para exibir no report
    END

Exibir lista de frutas
    # Percorre uma variavel de lista e as exibe
    FOR    ${FRUTAS}    IN    @{FRUTAS}
        Log To Console    "sua fruta é: ${FRUTAS}"    # para exibir no console
        Log               "sua fruta é: ${FRUTAS}"    # para exibir no report
        
    END

Verificar numeros pares
    # Percorre uma lista determinada 
    FOR    ${NUMEROS}    IN RANGE    0    11
        # Divide os numeros e guarda a sobra na variavel
        ${RESTO}    Evaluate    ${NUMEROS} % 2

        # Se o resto for = 0 entao ele acrescenta +1 na variavel para contar quantos numeros parem tem
        IF    ${RESTO} == 0
            ${NUMEROS_PARES}    Evaluate    ${NUMEROS_PARES} + 1
        END
    END
    # Exibe o resultado
    Log                "de 0 ate ${NUMEROS} existem ${NUMEROS_PARES} numeros pares (contando com o 0)"    # para exibir no report
    Log To Console     "de 0 ate ${NUMEROS} existem ${NUMEROS_PARES} numeros pares (contando com o 0)"    # para exibir no console

Separar numeros da lista    
    # Percorre a lista
    FOR    ${ITEM}    IN    @{LISTA}
        # Tenta converter em numero inteiro, se der certo adiciona o numero na lista
        TRY
            ${NUM_INT}    Convert To Integer    ${ITEM}
            Append To List    ${NUM_LIST}    ${NUM_INT}    
        # Se nao der certo, exibe a mensagem de erro
        EXCEPT    
            log    ${MENSAGEM_ERRO}            
        # E exibe a mensagem com a lista só com numeros
        FINALLY
            Log                Nova lista de numeros: ${NUM_LIST}    # para exibir no report
            Log To Console     Nova lista de numeros: ${NUM_LIST}    # para exibir no console
        END
    END