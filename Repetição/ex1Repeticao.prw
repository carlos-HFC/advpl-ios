#include "Protheus.ch"

//Digitar dois valores, onde n�o pode ser zero
User Function infZero()
    local nVal1 := Val(FWInputBox("Digite o primeiro valor"))
    local nVal2 := Val(FWInputBox("Digite o segundo valor"))
    local nTotal := 0

    While (nVal1 == 0)
        nVal1 := Val(FWInputBox("O valor n�o pode ser zero. Por favor, digite o primeiro valor novamente"))
    EndDo

    While (nVal2 == 0)
        nVal2 := Val(FWInputBox("O valor n�o pode ser zero. Por favor, digite o segundo valor novamente"))
    EndDo

    nTotal := nVal1 / nVal2
    msginfo(i18n("A divis�o entre #1 e #2 � igual a #3", {nVal1, nVal2, nTotal}))
Return