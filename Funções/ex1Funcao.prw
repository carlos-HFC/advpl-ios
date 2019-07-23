#include "Protheus.ch"

User Function funSoma()
    local nValor1 := Val(FWInputBox("Digite o primeiro valor"))
    local nValor2 := Val(FWInputBox("Digite o segundo valor"))
    local nTotal
    nTotal := u_retSoma(nValor1, nValor2)

    msginfo(i18n("A soma entre #1 e #2 é #3", {nValor1, nValor2, nTotal}))
Return

User Function retSoma(nValor1, nValor2)
    local nRet := 0
    nRet := nValor1 + nValor2
Return nRet