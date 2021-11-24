*Settings*
Documentation           Ações do projeto NBANK


*Keywords*
Go To Home Page
    Go To       ${BASE_URL}
    Wait For Elements State     css=.carousel       visible     5

Verificar titulo
    Get Title                       equal               nBank by QAninja

Verificar saldo inicial      
    Wait For Elements State         css=.navbar-item >> text="Olá Papito, seu saldo é R$ 1000"
    ...                             visible         5

Go To Fazer PIX
    #Checkpoint para validar se abriu modal para inserir dados do PIX
    Click       text=Fazer PIX
      
    Wait For Elements State
    ...         css=button >> text=Enviar PIX       visible     5

Fill Pix Modal
    [Arguments]         ${pix}

    Select Options By       css=.field select       text       ${pix}[banco]
    Fill Text               id=chave-pix            ${pix}[chave]
    Fill Text               id=valor                ${pix}[valor]

Enviar Pix Form
    Click               css=button >> text=Enviar PIX

Verificar saldo atual
    [Arguments]         ${expected_balance}

    ${element}          Set Variable            xpath=//a[contains(text(), 'saldo')]

    Wait For Elements State     ${element}              visible       5
    Get Text                    ${element}              equal         ${expected_balance}

Pix Should Be Visible
    [Arguments]         ${pix}
    ${element}          Set Variable            xpath=//td[contains(text(), "${pix}[transacao]")]/..

    Wait For Elements State         ${element}          visible         5
    Get Text                        ${element}          contains        ${pix}[detalhes]
    Get Text                        ${element}          contains        ${pix}[valor]

Mensagem alerta
    [Arguments]         ${message}
    ${element}          Set Variable            css=.media-content

    Wait For Elements State         ${element}          visible         5
    Get Text                        ${element}          equal           ${message}