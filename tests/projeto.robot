*Settings*
Documentation       Suite de testes Projeto final Starter

Library         ${EXECDIR}/resources/factories/pix.py

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*

Cenario saldo
    Verificar titulo
    Verificar saldo inicial  

Cenario fazer pix
    ${pix}                      Pix positivo
    Verificar titulo
    Verificar saldo inicial  
    Go To Fazer pix
    Fill Pix Modal              ${pix}
    Enviar Pix Form
    Verificar saldo atual       Olá Papito, seu saldo é R$ 900
    Pix Should Be Visible       ${pix}

Cenario PIX com valor zero   

    ${pix}                      Pix Zero
    Verificar titulo
    Verificar saldo inicial  
    Go To Fazer pix
    Fill Pix Modal              ${pix}
    Enviar Pix Form
    Mensagem alerta              Oops. Transferir ZERO é osso hein...

Cenario PIX com valor negativo

    ${pix}                      Pix Negativo
    Verificar titulo
    Verificar saldo inicial  
    Go To Fazer pix
    Fill Pix Modal              ${pix}
    Enviar Pix Form
    Mensagem alerta              Oops. Valor para PIX incorreto...





