#include "Protheus.ch"

User Function fParImp()
    local nValor1 := Val(FWInputBox("Digite um n�mero"))
    local nTotal

    nTotal := u_rParImp(nValor1)

    If nTotal == .t.
        nTotal := "par"
    ElseIf nTotal == .f.
        nTotal := "�mpar"
    EndIf
    msginfo(i18n("O n�mero #1 � #2", {nValor1, nTotal}))
Return

User Function rParImp(nValor1)
    local lParImp := .T.

    If nValor1 % 2 = 0
        lParImp := .T.
    Else
        lParImp := .f.
    EndIf    
Return lParImp