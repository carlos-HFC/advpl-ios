#include 'Protheus.ch'

//NÃºmero maior ou menor
User Function value2()
   local nVal1 := nVal2 := 0

   nVal1 := Val(FWInputBox("Digite o primeiro valor"))
   nVal2 := Val(FWInputBox("Digite o segundo valor"))

   If nVal1 > nVal2
      alert(cValToChar(nVal1) + " é maior que " + cValToChar(nVal2))
   ElseIf nVal1 < nVal2
      alert(cValToChar(nVal1) + " é menor que " + cValToChar(nVal2))
   Else
      alert("Os valores " + cValToChar(nVal1) + " e " + cValToChar(nVal2) + " são iguais") 
   EndIf
Return 