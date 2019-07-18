#include "Protheus.ch"

//Somar os maiores números digitados
User Function somaDois
   local nNum1 := nNum2 := nNum3 := nTot := 0

   nNum1 := Val(FWInputBox("Digite o primeiro número"))
   nNum2 := Val(FWInputBox("Digite o segundo número"))
   nNum3 := Val(FWInputBox("Digite o terceiro número"))

   alert("Os números " + cValToChar(nNum1) + ", " + cValToChar(nNum2) + " e " + cValToChar(nNum3) + " foram digitados")

   Do Case
      Case nNum1 < nNum2 .AND. nNum1 < nNum3
         nTot := nNum2 + nNum3
         alert("O número " + cValToChar(nNum1) + " é o menor número entre eles. Logo, a soma dos maiores números, " + cValToChar(nNum2) + " e " + cValToChar(nNum3) + " é igual a " + cValToChar(nTot))
      Case nNum2 < nNum1 .AND. nNum2 < nNum3
         nTot := nNum1 + nNum3
         alert("O número " + cValToChar(nNum2) + " é o menor número entre eles. Logo, a soma dos maiores números, " + cValToChar(nNum1) + " e " + cValToChar(nNum3) + " é igual a " + cValToChar(nTot))
      Otherwise
         nTot := nNum1 + nNum2
         alert("O número " + cValToChar(nNum3) + " é o menor número entre eles. Logo, a soma dos maiores números, " + cValToChar(nNum1) + " e " + cValToChar(nNum2) + " é igual a " + cValToChar(nTot))
   EndCase   
Return 