#include "Protheus.ch"

//
User Function novoCalc()
    local cNome := cAsk := ''
    local nAval1 := nAval2 := nMedia := 0

    cNome := FWInputBox("Digite o nome do aluno")
    nAval1 := Val(FWInputBox(i18n("Digite a nota da primeira avalia��o do(a) #1", {cNome})))
    nAval2 := Val(FWInputBox(i18n("Digite a nota da segunda avalia��o do(a) #1", {cNome})))

    While (nAval1 < 0 .or. nAval1 > 10)
        nAval1 := Val(FWInputBox("Nota inv�lida. Por favor, digite uma nota v�lida"))
    EndDo

    While (nAval2 < 0 .or. nAval2 > 10)
        nAval2 := Val(FWInputBox("Nota inv�lida. Por favor, digite uma nota v�lida"))
    EndDo

    nMedia := (nAval1 + nAval2) / 2
    msginfo(i18n("A m�dia do(a) #1 foi #2", {cNome, nMedia}))
    cAsk := FWInputBox("Deseja realizar um novo c�lculo? (S/N)")

    While cAsk == 's' .or. cAsk == 'S'
        cNome := FWInputBox("Digite o nome do aluno")
        nAval1 := Val(FWInputBox(i18n("Digite a nota da primeira avalia��o do(a) #1", {cNome})))
        nAval2 := Val(FWInputBox(i18n("Digite a nota da segunda avalia��o do(a) #1", {cNome})))

        While (nAval1 < 0 .or. nAval1 > 10)
            nAval1 := Val(FWInputBox("Nota inv�lida. Por favor, digite uma nota v�lida"))
        EndDo

        While (nAval2 < 0 .or. nAval2 > 10)
            nAval2 := Val(FWInputBox("Nota inv�lida. Por favor, digite uma nota v�lida"))
        EndDo

        nMedia := (nAval1 + nAval2) / 2
        msginfo(i18n("A m�dia do(a) #1 foi #2", {cNome, nMedia}))        
    EndDo
Return