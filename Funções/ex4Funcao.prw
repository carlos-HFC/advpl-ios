#include "Protheus.ch"

User Function funPot()
    local nValor1 := Val(FWInputBox("Digite a base"))
    local nValor2 := Val(FWInputBox("Digite o expoente"))
    local nTotal
    nTotal := u_retPot(nValor1, nValor2)

    msginfo(i18n("#1 elevado a #2 é #3", {nValor1, nValor2, nTotal}))
Return

User Function retPot(nValor1, nValor2)
    local nRet := 0
    nRet := pow(nValor1, nValor2)
Return nRet