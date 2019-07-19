#include "Protheus.ch"

//Tabuada a partir do número digitado pelo usuário, não podendo ser maior que dez ou menor que zero
user Function tabuada()
    local nCont := nBase := nNumero := 0

    nNumero := Val(FWInputBox("Digite um número"))
    If nNumero < 0 .or. nNumero > 10
        nNumero := Val(FWInputBox("Número inválido. Digite outro número"))
    EndIf
    
    While (nCont <= 10)
        nBase := nCont * nNumero
        msginfo(i18n("#1 x #2 = #3", {nCont, nNumero, nBase}))
        nCont++
    End    
Return