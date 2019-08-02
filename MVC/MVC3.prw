#include "Protheus.ch"

User Function autorMus()
    local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("ZA1")
    oBrowse:SetMenuDef("MVC3")
    oBrowse:Activate()
Return 

Static Function MenuDef()
Return FWMVCMenu("MVC3")

Static Function ModelDef()
    local oModel := MPFormModel():New("COISA")
    local oStruZA1 := FWFormStruct(1, "ZA1")
    local oStruZA2 := FWFormStruct(1, "ZA2")
    local bPos := {|oModelField| VldMusica(oModelField)}
    //local bValid := {|oModelGrid| ValidAutor(oModelGrid)}

    oModel:AddFields("ZA1MASTER",/* OWNER */, oStruZA1, /* bPre */, bPos)
    oModel:AddGrid('ZA2GRID', 'ZA1MASTER', oStruZA2,, /*bValid*/) 
    oModel:SetRelation('ZA2GRID', { {'ZA2_FILIAL', "xFilial('ZA2')"},;
    {"ZA2_MUSICA" , "ZA1_MUSICA"} }, ZA2->(IndexKey(1)))

    oModel:GetModel('ZA1MASTER'):SetDescription('Dados da Música')
    oModel:GetModel('ZA2GRID'):SetDescription('Dados do Autor Da Música')
Return oModel

Static Function VldMusica(oModelField)
    local lOK := .T.
    local dCriar := oModelField:GetValue("ZA1_DATA")
    local cGenero := oModelField:GetValue("ZA1_GENERO")

    If dCriar > DATE()
        lOK := .F.
        HELP(,, 'Data de Criação',, 'Data de criação não pode ser maior que a data atual',1,0,,,,,, {"Exemplo: " + CRLF + "Data de Hoje: " + dToC(DATE()) + CRLF + "Data de Criação: " + dToC(dCriar)})
    ElseIf EMPTY(cGenero)
        lOK := .F.
        HELP(,, 'Gênero',, 'Gênero não pode ser vazio',1,0,,,,,, {"Selecione um dos gêneros no campo de seleção"})
    EndIf    
Return lOK

Static Function ViewDef()
    local oView := FWFormView():New()
    local oStructZA1 := FWFormStruct(2, "ZA1")
    Local oStructZA2 := FWFormStruct(2, "ZA2")
    
    oView:SetModel(ModelDef())

    oView:AddField("ZA1_VIEW", oStructZA1, "ZA1MASTER")
    oView:AddGrid('ZA2_VIEW', oStructZA2, 'ZA2GRID')

    oView:AddIncrementField('ZA2_VIEW', 'ZA2_ITEM')

    oView:CreateHorizontalBox("BOXZA1", 50)
    oView:CreateHorizontalBox("BOXZA2", 50)

    oView:SetOwnerView("ZA1_VIEW", "BOXZA1")
    oView:SetOwnerView("ZA2_VIEW", "BOXZA2")

    oView:EnableTitleView('ZA1_VIEW')
    oView:EnableTitleView('ZA2_VIEW')
Return oView

/*Static Function ValidAutor(oModelGrid)
    local lOK := .F.
    local cCodAutor := oModelGrid:GetValue("ZA2_AUTOR")

    DbSelectArea("ZA0")
    ZA0->(DbSetOrder(1))

    If ZA0->(DbSeek(xFilial("ZA0") + cCodAutor))
        If EMPTY(!ZA0->ZA0_DTAFAL)
            
        Else
            
        EndIf
    Else
        
    EndIf
Return lOk*/