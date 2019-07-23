#include "Protheus.ch"

User Function pesoId()
    local nAltura := Val(FWInputBox("Digite a sua altura"))
    local cSexo := FWInputBox("Digite M para masculino e F para feminino")
    local nIdeal

    nIdeal := u_IMC(nAltura, cSexo)

    msginfo(i18n("De acordo com a sua altura, #1, seu peso ideal é: #2", {nAltura, nIdeal}))
Return

User Function IMC(nAltura, cSexo)
    local nRet := 0
    If upper(cSexo) == 'M'
        nRet := 72.7 * nAltura - 58
    ElseIf upper(cSexo) == 'F' 
        nRet := 62.1 * nAltura - 44.7
    EndIf
Return nRet