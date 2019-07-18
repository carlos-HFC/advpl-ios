#include "Protheus.ch"

//Somar os maiores n�meros digitados
User Function somaDois
   local nNum1 := nNum2 := nNum3 := nTot := 0

   nNum1 := Val(FWInputBox("Digite o primeiro n�mero"))
   nNum2 := Val(FWInputBox("Digite o segundo n�mero"))
   nNum3 := Val(FWInputBox("Digite o terceiro n�mero"))

   alert("Os n�meros " + cValToChar(nNum1) + ", " + cValToChar(nNum2) + " e " + cValToChar(nNum3) + " foram digitados")

   Do Case
      Case nNum1 < nNum2 .AND. nNum1 < nNum3
         nTot := nNum2 + nNum3
         alert("O n�mero " + cValToChar(nNum1) + " � o menor n�mero entre eles. Logo, a soma dos maiores n�meros, " + cValToChar(nNum2) + " e " + cValToChar(nNum3) + " � igual a " + cValToChar(nTot))
      Case nNum2 < nNum1 .AND. nNum2 < nNum3
         nTot := nNum1 + nNum3
         alert("O n�mero " + cValToChar(nNum2) + " � o menor n�mero entre eles. Logo, a soma dos maiores n�meros, " + cValToChar(nNum1) + " e " + cValToChar(nNum3) + " � igual a " + cValToChar(nTot))
      Otherwise
         nTot := nNum1 + nNum2
         alert("O n�mero " + cValToChar(nNum3) + " � o menor n�mero entre eles. Logo, a soma dos maiores n�meros, " + cValToChar(nNum1) + " e " + cValToChar(nNum2) + " � igual a " + cValToChar(nTot))
   EndCase   
Return 