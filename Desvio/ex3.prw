#include 'Protheus.ch'

//Número positivo, negativo ou zero
User Function posneg()
   local nVal1 := 0

   nVal1 := Val(FWInputBox("Digite o valor"))

   If nVal1 > 0
      alert(cValToChar(nVal1) + " é positivo")
   ElseIf nVal1 < 0
      alert(cValToChar(nVal1) + " é negativo")
   Else
      alert(cValToChar(nVal1) + " é igual a zero") 
   EndIf
Return 