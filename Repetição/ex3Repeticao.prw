#include "Protheus.ch"

//
User Function novoCalc()
    local cNome := cAsk := ''
    local nAval1 := nAval2 := nMedia := 0

    cNome := FWInputBox("Digite o nome do aluno")
    nAval1 := Val(FWInputBox(i18n("Digite a nota da primeira avaliação do(a) #1", {cNome})))
    nAval2 := Val(FWInputBox(i18n("Digite a nota da segunda avaliação do(a) #1", {cNome})))

    While (nAval1 < 0 .or. nAval1 > 10)
        nAval1 := Val(FWInputBox("Nota inválida. Por favor, digite uma nota válida"))
    EndDo

    While (nAval2 < 0 .or. nAval2 > 10)
        nAval2 := Val(FWInputBox("Nota inválida. Por favor, digite uma nota válida"))
    EndDo

    nMedia := (nAval1 + nAval2) / 2
    msginfo(i18n("A média do(a) #1 foi #2", {cNome, nMedia}))
    cAsk := FWInputBox("Deseja realizar um novo cálculo? (S/N)")

    While cAsk == 's' .or. cAsk == 'S'
        cNome := FWInputBox("Digite o nome do aluno")
        nAval1 := Val(FWInputBox(i18n("Digite a nota da primeira avaliação do(a) #1", {cNome})))
        nAval2 := Val(FWInputBox(i18n("Digite a nota da segunda avaliação do(a) #1", {cNome})))

        While (nAval1 < 0 .or. nAval1 > 10)
            nAval1 := Val(FWInputBox("Nota inválida. Por favor, digite uma nota válida"))
        EndDo

        While (nAval2 < 0 .or. nAval2 > 10)
            nAval2 := Val(FWInputBox("Nota inválida. Por favor, digite uma nota válida"))
        EndDo

        nMedia := (nAval1 + nAval2) / 2
        msginfo(i18n("A média do(a) #1 foi #2", {cNome, nMedia}))        
    EndDo
Return