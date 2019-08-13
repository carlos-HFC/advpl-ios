#include 'protheus.ch'
#include 'fwmvcdef.ch'

user function projeto3()
    local oBrowse := FWMBrowse():New() //Criar browse
    oBrowse:SetAlias('ZA7') //PLAYLIST
    oBrowse:SetMenuDef('valida')
    oBrowse:Activate() // ativar o browse
Return

Static Function Menudef()
Return FWMVCMenu('valida') //Menu padrão com C.R.U.D. //nome da fonte

Static function ModelDef() //sempre staticfunction
    local oModel := MPFormModel():New('ZA7MODEL')
    local oStruZA7 := FWFormStruct(1,'ZA7') //cria estrutura
    local oStruZA8 := FWFormStruct(1,'ZA8') //cria estrutura
    local oStruZA2 := FWFormStruct(1,'ZA2') //cria estrutura
    local bValid := {|oModelField| VldPlaylist(oModelField)}
    local bPlay := {|oModelGrid| validaP(oModelGrid)}

    oModel:AddFields('ZA7MASTER',/*Owner*/ , oStruZA7,/**/, bValid) // adiciona
    oModel:AddGrid('ZA8DETAIL', 'ZA7MASTER', oStruZA8, , bPlay)
    oModel:AddGrid('ZA2DETAIL', 'ZA7MASTER', oStruZA2,,)


    oModel:SetRelation( 'ZA8DETAIL', { {'ZA8_FILIAL', "xFilial('ZA8')"}, {"ZA8_PLAY" , "ZA7_CODIGO"} }, ZA8->( IndexKey( 1 ) ) )
     oModel:GetModel('ZA8DETAIL'):SetDescription('Musicas da playlist')
     oModel:GetModel('ZA2DETAIL'):SetDescription('Pesquisar Interpretes')
     oModel:GetModel( 'ZA8DETAIL' ):SetUniqueLine( { 'ZA8_MUSICA' } )

oStruZA2:AddField('SELECT', ' ', 'SELECT', 'L', 1, 0, , , {}, .F.,FWBuildFeature( STRUCT_FEATURE_INIPAD, ".F.")) 

oModel:GetModel('ZA2DETAIL'):SetOnlyQuery()

//define que o grid nao é obrigatorio
oModel:GetModel('ZA2DETAIL'):SetOptional()

oModel:SetActivate({|oModel| AfterActivate(oModel)})

Return oModel

Static Function ViewDef() //sempre static function
    local oView := FWFormView():New() //objeto da view
    local oStruct := FWFormStruct(2,'ZA7')
    local oStructZA8 := FWFormStruct(2,'ZA8') 
    local oStructZA2 := FWFormStruct(2,'ZA2')
    oView:SetModel(ModelDef()) // linka a view com o model

    oStruct:RemoveField('ZA7_FILIAL')
    oStructZA8:RemoveField('ZA8_FILIAL')
    oStructZA8:RemoveField('ZA8_PLAY')
    oStructZA8:RemoveField('ZA8_ALBUM')

    oStructZA2:AddField( 'SELECT','01','SELECT','SELECT',, 'Check')
    oView:AddField('ZA7_VIEW', oStruct, 'ZA7MASTER')
    oView:AddGrid('ZA8_VIEW', oStructZA8, 'ZA8DETAIL')
    oView:AddGrid('ZA2_VIEW', oStructZA2, 'ZA2DETAIL')
    
    oView:AddOtherObject("PANEL_SEL",{|oPanel,oOtherObject| criaButtonSel(oPanel,oOtherObject)})
    
    oView:CreateHorizontalBox('BOXZA7', 30)
    oView:CreateHorizontalBox('BOXZA8', 30)
    oView:CreateHorizontalBox('BOXZA2', 30)
    oView:CreateHorizontalBox( "BOX_SEL",10)
    

    oView:SetOwnerView('ZA7_VIEW','BOXZA7') //colocar um componente no outro
    oView:SetOwnerView('ZA8_VIEW','BOXZA8') //colocar um componente no outro
    oView:SetOwnerView('ZA2_VIEW','BOXZA2') //colocar um componente no outro
    oView:SetOwnerView('PANEL_SEL','BOX_SEL')
    oView:EnableTitleView('ZA8_VIEW')

    

Return oView

Static Function VldPlaylist(oModelField)
    local lOK := .T.
    //local lPremium := oModelField:GetModel():GetValue('ZA7MASTER', "ZA7_PREMIU")
    local cNome := oModelField:GetValue("ZA7_NOME")
    local dCriar := oModelField:GetValue("ZA7_DATA")
    local cPasta := oModelField:GetValue("ZA7_PATH")

    If EMPTY(dCriar)
        oModelField:SetValue("ZA7_DATA",DATE())
    ElseIf dCriar > DATE()
        lOK := .F.
        HELP(,, 'Data de Criação',, 'Data de criação não pode ser maior que a data atual',1,0,,,,,, {"Exemplo: " + CRLF + "Data de Hoje: " + dToC(DATE()) + CRLF + "Data de Criação: 01/01/2010"})
    ElseIf EMPTY(cPasta)
        lOK := .F.
        HELP(,, 'Path',, 'Diretório da playlist não pode ser vazio',1,0,,,,,, {"Preencha o Path"})
    ElseIf EMPTY(cNome)
        lOK := .F.
        HELP(,, 'Descrição',, 'Nome da playlist não pode ser vazia',1,0,,,,,, {"Preencha o campo Descrição"})
    EndIf
Return lOK

Static Function validaP(oModelGrid)
    local lOK := .T.
    local lPremium := oModelGrid:GetModel():GetValue('ZA7MASTER', "ZA7_PREMIU")

    If oModelGrid:Length() > 5 .and. lPremium == .f.
        lOK := .F.
        HELP(,, 'Playlist',, 'A playlist não pode conter mais de 5 músicas',1,0,,,,,, {"Escolha apenas 5 músicas para a sua playlist!"})
    EndIf
Return lOK

Static Function criaButtonSel(oPanel,oOtherObject)
    TButton():New( 01, 10, "Selecionar Todos",oPanel,{|| SelGrid(oOtherObject)}, 60,10,,,.F.,.T.,.F.,,.F.,,,.F. )
Return

Static Function SelGrid(oOtherObject)
Local oGrid := oOtherObject:GetModel():GetModel("ZA2DETAIL")
Local nX
Local lValue
    For nX:=1 to oGrid:Length()
        oGrid:GoLine(nX)
        If !oGrid:isDeleted()
            lValue := oGrid:GetValue("SELECT")
            oGrid:LoadValue("SELECT", !lValue)
        EndIf
    Next nX
    oGrid:GoLine(1)
    oOtherObject:oControl:Refresh('ZA2_VIEW')
Return

Static Function AfterActivate(oModel)
Local aAreaZA2 := ZA2->(GetArea())
Local cMyCode := oModel:GetValue("ZA2DETAIL", "ZA2_AUTOR") 
Local oGridConsulta := oModel:GetModel("ZA2DETAIL")
Local cMyFilial := xFilial("ZA2")

    ZA2->(DBSetOrder(1))    
    If ZA2->(DBSeek(cMyFilial))
        While ZA2->(!EOF()) .And. ZA2->ZA2_FILIAL == cMyFilial
            //Verifica se o grid tem aquela primeira linha em branco
            If !oGridConsulta:SeekLine({{"ZA2_AUTOR",ZA2-> ZA2_AUTOR}})
                If !oGridConsulta:IsEmpty()
                    //Adiciona uma linha no grid
                    oGridConsulta:AddLine()
                EndIf
                
                //Adiciona valores na linha, sem executar validacao e gatilho
                oGridConsulta:LoadValue("ZA2_AUTOR", ZA2-> ZA2_AUTOR)     

                ZA2->(DBSkip())
            EndIf
        EndDo
    EndIf

RestArea(aAreaZA2)
Return