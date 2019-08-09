#include "Protheus.ch"
#include 'FWMVCDEF.ch'

User Function autorMus()
    local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("ZA1")
    oBrowse:SetMenuDef("MVC3")
    oBrowse:Activate()
Return 

Static Function MenuDef()
Local aRotina :=  FWMVCMenu('autorMus') 

ADD OPTION aRotina Title 'Player gráfico' Action 'u_player' OPERATION 2 ACCESS 0

/*ADD OPTION aRotina Title 'Visualizar' Action 'VIEWDEF.IOS02' OPERATION 2 ACCESS 0
ADD OPTION aRotina Title 'Incluir'    Action 'VIEWDEF.IOS02' OPERATION 3 ACCESS 0
ADD OPTION aRotina Title 'Alterar'    Action 'VIEWDEF.IOS02' OPERATION 4 ACCESS 0
ADD OPTION aRotina Title 'Excluir'    Action 'VIEWDEF.IOS02' OPERATION 5 ACCESS 0
ADD OPTION aRotina Title 'Imprimir'   Action 'VIEWDEF.IOS02' OPERATION 8 ACCESS 0
ADD OPTION aRotina Title 'Copiar'     Action 'VIEWDEF.IOS02' OPERATION 9 ACCESS 0
*/
Return aRotina

user function player()
local oDlg
local aItems := {}
Local nlist := 1

local oList1, oMedia

DEFINE MSDIALOG oDlg TITLE 'cTitulo' FROM 000,000 TO 800,800 PIXEL

oList1 := TListBox():New(001,001,{|u|if(Pcount()>0,nList:=u,nList)},;
                         {'Item 1','Item 2','Item 3','Item 4'},100,100,,oDlg,,,,.T.)

oMedia := TMediaPlayer():New(50,100, 200, 200, oDlg, "", 70, .T.)
ACTIVATE MSDIALOG oDlg CENTERED


Return

Static Function ModelDef()
    local oModel := MPFormModel():New("ZA1MODEL")
    local oStruZA1 := FWFormStruct(1, "ZA1")
    local oStruZA2 := FWFormStruct(1, "ZA2")
    local bPos := {|oModelField| VldMusica(oModelField)}
    //local bValid := {|oModelGrid| ValidAutor(oModelGrid)}

    oModel:AddFields("ZA1MASTER",/* OWNER */, oStruZA1, /* bPre */, bPos)
    oModel:AddGrid('ZA2GRID', 'ZA1MASTER', oStruZA2,, /*bValid*/) 
    oModel:SetRelation('ZA2GRID', { {'ZA2_FILIAL', "xFilial('ZA2')"}, {"ZA2_MUSICA" , "ZA1_MUSICA"} }, ZA2->(IndexKey(1)))

    oModel:GetModel('ZA1MASTER'):SetDescription('Dados da Música')
    oModel:GetModel('ZA2GRID'):SetDescription('Dados do Autor Da Música')
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