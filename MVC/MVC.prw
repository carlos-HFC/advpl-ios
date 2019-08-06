#include "Protheus.ch"

User Function autor()
    local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("ZA0")
    oBrowse:SetMenuDef("MVC")
    oBrowse:Activate()
Return 

Static Function MenuDef()
Return FWMVCMenu("MVC")

Static Function ModelDef()
    local oModel := MPFormModel():New("ZA0MODEL")
    local oStruZA0 := FWFormStruct(1, "ZA0")
    local bPos := {|oModelField| PosVldAutor(oModelField)}

    oModel:AddFields("ZA0MASTER", /* OWNER */, oStruZA0, /* bPre */, bPos)
Return oModel

Static Function PosVldAutor(oModelField)
    local lOK := .T.
    local dFalec := oModelField:GetValue("ZA0_DTAFAL")
    local cNome := oModelField:GetValue("ZA0_NOME")

    If dFalec > DATE()
        lOK := .F.
        HELP(,, 'Data de Falecimento',, 'Data de falecimento não pode ser maior que a data atual',1,0,,,,,, {"Exemplo: " + CRLF + "Data de Hoje: " + dToC(DATE()) + CRLF + "Data de Falecimento: 01/01/2010"})
    ElseIf 'RICARDO' $ UPPER(cNome) .OR. EMPTY(cNome)
        lOK := .F.
        HELP(,, 'Nome',, 'Nome em branco ou não pode conter o nome "Ricardo"',1,0,,,,,, {"Exemplo: " + CRLF + "José Silva" + CRLF + "Paulo Augusto" + CRLF + "João Santos"})
    EndIf    
Return lOK

Static Function ViewDef()
    local oView := FWFormView():New()
    local oStruct := FWFormStruct(2, "ZA0")

    oView:SetModel(ModelDef())
    oView:AddField("ZA0_VIEW", oStruct, "ZA0MASTER")
    oView:CreateHorizontalBox("BOXZA0", 100)
    oView:SetOwnerView("ZA0_VIEW", "BOXZA0")
Return oView