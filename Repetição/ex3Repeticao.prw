#include "Protheus.ch"

//Calcular média do aluno. As avaliaçãoes não podem ser maiores que dez ou menores que zero. Perguntar se deseja calcular novamente
User Function novoCalc()
    local cNome := '' 
    local lAsk := .t.
    local nAval1 := nAval2 := nMedia := 0

    While lAsk
        cNome := FWInputBox("Digite o nome do aluno")
        nAval1 := Val(FWInputBox(i18n("Digite a nota da primeira avaliação do(a) #1", {cNome})))        

        While (nAval1 < 0 .or. nAval1 > 10)
            nAval1 := Val(FWInputBox("Nota inválida. Por favor, digite a primeira nota novamente"))
        EndDo

        nAval2 := Val(FWInputBox(i18n("Digite a nota da segunda avaliação do(a) #1", {cNome})))
        While (nAval2 < 0 .or. nAval2 > 10)
            nAval2 := Val(FWInputBox("Nota inválida. Por favor, digite a segunda nota novamente"))
        EndDo

        nMedia := (nAval1 + nAval2) / 2
        msginfo(i18n("A média do(a) #1 foi #2", {cNome, nMedia}))
        lAsk := msgyesno("Deseja realizar um novo cálculo?", "Novo Cálculo")
    EndDo
Return