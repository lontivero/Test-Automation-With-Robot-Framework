*** Settings ***
Documentation    This file contains the tast cases for seaching and
...  filtering published products.

Library                SeleniumLibrary
Library                String
Resource               Common.robot

Test Teardown          Close Browser

*** Test Cases ***
Users can visit the site and search for products
    [Documentation]  User should be able to search for existing products and
    ...  add available filters to the results page. In this test we look for
    ...  laptops DELL with Intel Core i7 processor

    Open Browser To Mercado Libre
    Search For              Laptop
    Filter Page Results By  Intel Core i7
    Filter Page Results By  Dell


Users can search for non-existing products
    [Documentation]  User should be able to searh for non-existing products
    ...  and show no results

    Open Browser To Mercado Libre
    Search For              caldodemurciélagosensobrecitos
    Page should not display any result


Users can select a price range for the product
    [Documentation]  User should be able to searh for products, narrowing the
    ...  result set by specifying a price range

    Open Browser To Mercado Libre
    Search For              Laptop
    Filter Page Results By Price Between "25000" And "30000"
    Page should display some results


Users can select a price range for the product (no matching)
    [Documentation]  User should be able to searh for products, narrowing the
    ...  results set by selecting the price range

    Open Browser To Mercado Libre Deportes  aerobics-fitness  bicicletas-fijas
    Filter Page Results By Price Between "70000" And "70001"
    Page should display some results
