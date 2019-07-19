#include "Protheus.ch"

//Tabuada a partir do n�mero digitado pelo usu�rio, n�o podendo ser maior que dez ou menor que zero
user Function tabuada()
    local nCont := nBase := nNumero := 0

    nNumero := Val(FWInputBox("Digite um n�mero"))
    If nNumero < 0 .or. nNumero > 10
        nNumero := Val(FWInputBox("N�mero inv�lido. Digite outro n�mero"))
    EndIf
    
    While (nCont <= 10)
        nBase := nCont * nNumero
        msginfo(i18n("#1 x #2 = #3", {nCont, nNumero, nBase}))
        nCont++
    End    
Return