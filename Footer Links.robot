*** Settings ***
Library                SeleniumLibrary
Resource               Common.robot

*** Settings ***
Suite teardown         Close all browsers

*** Test Cases ***
Click Page Links
    [Template]       Click on ${link} shoud go to page ${titled}
    Términos y condiciones                   Términos y condiciones de uso del Sitio
    Políticas de privacidad                  Políticas de privacidad y confidencialidad de la información
    Ayuda                                    ¿Con qué podemos ayudarte?

*** keywords ***
Click on ${link} shoud go to page ${titled}
    Open Browser To Mercado Libre
    Click Link            ${link}
    Page Should Contain   ${titled}
