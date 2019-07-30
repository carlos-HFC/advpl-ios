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
    local oModel := MPFormModel():New("COISA")
    local oStruZA0 := FWFormStruct(1, "ZA0")

    oModel:AddFields("ZA0MASTER",,oStruZA0)
Return oModel

Static Function ViewDef()
    local oView := FWFormView():New()
    local oStruct := FWFormStruct(2, "ZA0")

    oView:SetModel(ModelDef())
    oView:AddField("ZA0_VIEW", oStruct, "ZA0MASTER")
    oView:CreateHorizontalBox("BOXZA0", 100)
    oView:SetOwnerView("ZA0_VIEW", "BOXZA0")
Return oView