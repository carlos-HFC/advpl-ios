#include "Protheus.ch"

User Function futebol
   local cTime1 := cTime2 := ''
   local nGolsT1 := nGolsT2 := 0

   cTime1 := FWInputBox("Digite o nome do primeiro time")
   cTime2 := FWInputBox("Digite o nome do segundo time")
   nGolsT1 := Val(FWInputBox("Quantos gols o time " + cTime1 + " marcou?"))
   nGolsT2 := Val(FWInputBox("Quantos gols o time " + cTime2 + " marcou?"))

   If nGolsT1 > nGolsT2
      msginfo("O " + cTime1 + " foi o vencedor pelo placar de " + cValToChar(nGolsT1) + "x" + cValToChar(nGolsT2))
   ElseIf nGolsT1 < nGolsT2
      msginfo("O " + cTime2 + " foi o vencedor pelo placar de " + cValToChar(nGolsT2) + "x" + cValToChar(nGolsT1))
   Else
      msginfo("O jogo terminou empatado entre " + cTime1 + " e " + cTime2 + " pelo placar de " + cValToChar(nGolsT1) + "x" + cValToChar(nGolsT2))
   EndIf   
Return