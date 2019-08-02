#include "Protheus.ch"

User Function musica()
    local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("ZA1")
    oBrowse:SetMenuDef("MVC2")
    oBrowse:Activate()
Return 

Static Function MenuDef()
Return FWMVCMenu("MVC2")

Static Function ModelDef()
    local oModel := MPFormModel():New("COISA")
    local oStruZA1 := FWFormStruct(1, "ZA1")
    local bPos := {|oModelField| VldMusica(oModelField)}

    oModel:AddFields("ZA1MASTER", /* OWNER */, oStruZA1, /* bPre */, bPos)
Return oModel

Static Function VldMusica(oModelField)
    local lOK := .T.
    local dCriar := oModelField:GetValue("ZA1_DATA")
    local cGenero := oModelField:GetValue("ZA1_GENERO")

    If dCriar > DATE()
        lOK := .F.
        HELP(,, 'Data de Criação',, 'Data de criação não pode ser maior que a data atual',1,0,,,,,, {"Exemplo: " + CRLF + "Data de Hoje: " + dToC(DATE()) + CRLF + "Data de Criação: 01/01/2010"})
    ElseIf EMPTY(cGenero)
        lOK := .F.
        HELP(,, 'Gênero',, 'Gênero não pode ser vazio',1,0,,,,,, {"Selecione um dos gêneros no campo de seleção"})
    EndIf    
Return lOK

Static Function ViewDef()
    local oView := FWFormView():New()
    local oStructZA1 := FWFormStruct(2, "ZA1")

    oView:SetModel(ModelDef())

    oView:AddField("ZA1_VIEW", oStructZA1, "ZA1MASTER")

    oView:CreateHorizontalBox("BOXZA1", 50)

    oView:SetOwnerView("ZA1_VIEW", "BOXZA1")
Return oView