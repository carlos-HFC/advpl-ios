#include "Protheus.ch"

//Calcular m�dia do aluno. As avalia��oes n�o podem ser maiores que dez ou menores que zero. Perguntar se deseja calcular novamente
User Function novoCalc()
    local cNome := '' 
    local lAsk := .t.
    local nAval1 := nAval2 := nMedia := 0

    While lAsk
        cNome := FWInputBox("Digite o nome do aluno")
        nAval1 := Val(FWInputBox(i18n("Digite a nota da primeira avalia��o do(a) #1", {cNome})))        

        While (nAval1 < 0 .or. nAval1 > 10)
            nAval1 := Val(FWInputBox("Nota inv�lida. Por favor, digite a primeira nota novamente"))
        EndDo

        nAval2 := Val(FWInputBox(i18n("Digite a nota da segunda avalia��o do(a) #1", {cNome})))
        While (nAval2 < 0 .or. nAval2 > 10)
            nAval2 := Val(FWInputBox("Nota inv�lida. Por favor, digite a segunda nota novamente"))
        EndDo

        nMedia := (nAval1 + nAval2) / 2
        msginfo(i18n("A m�dia do(a) #1 foi #2", {cNome, nMedia}))
        lAsk := msgyesno("Deseja realizar um novo c�lculo?", "Novo C�lculo")
    EndDo
Return