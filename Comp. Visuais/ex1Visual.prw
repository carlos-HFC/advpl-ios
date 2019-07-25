#include "Protheus.ch"

user Function clsWnd()
    local oDlg, oSay, oFont := TFont():New('Arial',,-25,.T.)
    local cTitulo := 'Meu primeiro componente visual', cFrase := 'Clique no botão para fechar a janela'

    DEFINE MSDIALOG oDlg TITLE cTitulo FROM 0,0 TO 300,300 PIXEL
    @ 10,10 SAY oSay PROMPT cFrase SIZE 150,100 COLORS CLR_BLACK,CLR_WHITE OF oDlg PIXEL FONT oFont
    //@ 100,100 BUTTON 'Sair' FONT oFont SIZE 80,47 PIXEL OF oDlg ACTION oDlg:End()
    DEFINE SBUTTON 'SAIR' FONT oFont FROM 100,50 ACTION msginfo('A janela será fechada', oDlg:End()) ENABLE OF oDlg

    ACTIVATE MSDIALOG oDlg CENTERED
Return