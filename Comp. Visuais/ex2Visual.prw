#include "Protheus.ch"

user Function wndNS()
    local oDlg, oSay, oGet, oFont := TFont():New('Arial',,-20,.T.)
    local cTitulo := 'LOGIN', cNome := cPass := space(50)

    DEFINE MSDIALOG oDlg TITLE cTitulo FROM 0,0 TO 300,250 PIXEL
    @ 10,10 SAY oSay PROMPT 'Nome:' SIZE 150,100 COLORS CLR_BLACK,CLR_WHITE OF oDlg PIXEL FONT oFont
    @ 40,10 SAY oSay PROMPT 'Senha:' SIZE 150,100 COLORS CLR_BLACK,CLR_WHITE OF oDlg PIXEL FONT oFont

    @ 25,10 GET oGet VAR cNome SIZE 100,10 OF oDlg PIXEL VALID !empty(cNome)
    @ 55,10 GET oGet VAR cPass SIZE 100,10 OF oDlg PIXEL VALID !empty(cPass) PASSWORD

    @ 100,10 BUTTON 'OK' SIZE 45,20 PIXEL OF oDlg ACTION u_valida(cPass)
    @ 100,60 BUTTON 'CANCELAR' SIZE 45,20 PIXEL OF oDlg ACTION oDlg:End()

    ACTIVATE MSDIALOG oDlg CENTERED
Return

user Function valida(cPass)
    If alltrim(upper(cPass)) == 'IOS2019'
        msginfo('SENHA CORRETA')
    Else
        msginfo('SENHA INCORRETA')
    EndIf
Return