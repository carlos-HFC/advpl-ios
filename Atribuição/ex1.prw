#include 'Protheus.ch'

//Somar dois números
User Function somar()
   Local nNum1 := nNum2 := nTotal := 0
   Local cNum1 := cNum2 := ''
   
   cNum1 := FWInputBox("Digite o primeiro número: ")
   cNum2 := FWInputBox("Digite o segundo número: ")

   nNum1 := Val(cNum1)
   nNum2 := Val(cNum2)

   nTotal := nNum1 + nNum2
   alert('O resultado da soma entre ' + cValToChar(nNum1) + ' e ' + cValToChar(nNum2) + ' é igual a ' + cValToChar(nTotal))
Return