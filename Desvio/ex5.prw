#include 'Protheus.ch'

//Mostrar o maior n�mero
User Function valMaior()
   local nVal1 := nVal2 := nVal3 := 0

   nVal1 := Val(FWInputBox("Digite o primeiro valor"))
   nVal2 := Val(FWInputBox("Digite o segundo valor"))
   nVal3 := Val(FWInputBox("Digite o terceiro valor"))

   If nVal1 > nVal2 .AND. nVal1 > nVal3
      alert("O primeiro valor, " + cValToChar(nVal1) + ", � o maior n�mero")
   ElseIf nVal2 > nVal1 .AND. nVal2 > nVal3
      alert("O segundo valor, " + cValToChar(nVal2) + ", � o maior n�mero")
   Else
      alert("O terceiro valor, " + cValToChar(nVal3) + ", � o maior n�mero")
   EndIf   
Return 