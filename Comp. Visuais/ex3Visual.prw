#include "Protheus.ch"

user Function wndCad()
    local oDlg, oSay, oGet, oFont := TFont():New('Arial',,-20,.T.)
    local cTitulo := 'CADASTRO', cNome := cEnd := nIdade := cProf := space(150)

    DEFINE MSDIALOG oDlg TITLE cTitulo FROM 0,0 TO 300,400 PIXEL
    @ 10,10 SAY oSay PROMPT 'Nome:' SIZE 150,100 COLORS CLR_BLACK,CLR_WHITE OF oDlg PIXEL FONT oFont
    @ 40,10 SAY oSay PROMPT 'Endereço:' SIZE 150,100 COLORS CLR_BLACK,CLR_WHITE OF oDlg PIXEL FONT oFont
    @ 70,10 SAY oSay PROMPT 'Idade:' SIZE 150,100 COLORS CLR_BLACK,CLR_WHITE OF oDlg PIXEL FONT oFont 
    @ 100,10 SAY oSay PROMPT 'Profissão:' SIZE 150,100 COLORS CLR_BLACK,CLR_WHITE OF oDlg PIXEL FONT oFont

    @ 25,10 GET oGet VAR cNome SIZE 150,10 OF oDlg PIXEL VALID !empty(cNome)
    @ 55,10 GET oGet VAR cEnd SIZE 150,10 OF oDlg PIXEL VALID !empty(cEnd)
    @ 85,10 GET oGet VAR nIdade SIZE 150,10 OF oDlg PIXEL VALID !empty(nIdade)
    @ 115,10 GET oGet VAR cProf SIZE 150,10 OF oDlg PIXEL VALID !empty(cProf)

    @ 130,10 BUTTON 'CADASTRAR' SIZE 45,20 PIXEL OF oDlg ACTION msginfo(i18n('Senhor(a) #1, com #2 anos. Atualmente reside no endereço #3 e exerce a profissão de #4', {alltrim(cNome), alltrim(cValToChar(nIdade)), alltrim(cEnd), alltrim(cProf)}))
    @ 130,60 BUTTON 'CANCELAR' SIZE 45,20 PIXEL OF oDlg ACTION oDlg:End()

    ACTIVATE MSDIALOG oDlg CENTERED
Return

user Function idade(nIdade)
    If ValType(nIdade) == Type(nIdade) 

    ELSE
        alert('IDADE INCORRETA')
    EndIf
return