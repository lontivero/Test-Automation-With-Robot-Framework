
*** Variables ***
${DOMAIN}              mercadolibre.com.ar
${URL_HOME}            https://www.${DOMAIN}
${URL_DEPORTES}        https://deportes.${DOMAIN}
${URL_REGISTRATION}    https://registration.${DOMAIN}/registration
${BROWSER}             firefox

*** Keywords ***
Open Browser To Mercado Libre
    Open Browser      ${URL_HOME}     ${BROWSER}
    Title Should Be   Mercado Libre Argentina
    Set Browser Size

Open Browser To Mercado Libre Deportes
    [Arguments]       ${category}     ${subcategory}
    Open Browser      ${URL_DEPORTES}/${category}/${subcategory}   ${BROWSER}
    Set Browser Size

Open Browser To Registration Page
    Open Browser      ${URL_REGISTRATION}    ${BROWSER}
    Title Should Be   Regístrate en Mercado Libre
    Set Browser Size

Set Browser Size
    Run Keyword If   '${RESOLUTION}' == '720x1280'   Set Window Size  720  1280
    Run Keyword If   '${RESOLUTION}' == '750x1334'   Set Window Size  750  1334
    Run Keyword If   '${RESOLUTION}' == '1920x1080'  Set Window Size  1920  1080
    Run Keyword If   '${RESOLUTION}' == ''           Maximize Browser Window

Search For
    [Arguments]       ${criteria}
    Input Text        class=nav-search-input   ${criteria}
    Click Button      class=nav-search-btn

Filter Page Results By
    [Arguments]       ${filter}
    Click Link        //a[@class='qcat-truncate' and contains(text(),'${filter}')]
    Page Should Contain Element    //h2[@class='applied-fliter']/div[contains(text(), '${filter}')]

Select First Product
    Click Link        (//ol[@id='searchResults']/li)[1]//div[@class='image-content']/a

Press Buy Button
    Click Button      BidButtonTop

Search Title Should By ${criteria}
    ${lcriteria} =    Convert To Lowercase     ${criteria}
    Element Text Should Be    class=breadcrumb__title    ${lcriteria}

Filter Page Results By Price Between ${fromPrice} And ${toPrice}
    Input Text         fromPrice      ${fromPrice}
    Input Text         toPrice        ${toPrice}
    Submit Form        priceForm

Page should not display any result
    Element Should Contain    class=header__title   hay publicaciones que coincidan con tu búsqueda.

Page should display some results
    Page Should Not Contain Element    class=header__title

#Filter Page Results By Price From
#    [Arguments]       ${fromPrice}    ${toPrice}
#    Input Text        fromPrice       ${fromPrice}
#    Input Text        toPrice         ${toPrice}
#    Wait Until Element Is Enabled     //button[contains(@class, 'price-filter__action-link')]
#    Click Button      //button[contains(@class, 'price-filter__action-link')]
