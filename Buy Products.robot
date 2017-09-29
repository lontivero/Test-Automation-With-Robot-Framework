*** Settings ***
Documentation  This file contains the test cases for buying products with
...  different characteristics and in different situations.

Library                SeleniumLibrary
Resource               Common.robot
Test Teardown          Close Browser

*** Test Cases ***
Users needs to be logged in in order to buy
    [Documentation]  Users should be required to log in before buying any
    ...  product, if they are not already.

    Open Browser To Mercado Libre
    Search For              Bicicleta Fija
    Filter Page Results By  Nuevo
    Select First Product
    Press Buy Button
    Title Should Be         ¡Hola! Para comprar, ingresa a tu cuenta
