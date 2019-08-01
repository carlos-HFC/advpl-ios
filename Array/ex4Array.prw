#include "Protheus.ch"

User Function array4()
   local aArray := {}

   aAdd(aArray, {"Carlos", {10, 10, 10, 10}})
   aAdd(aArray, {"Klinton", {9, 9, 9, 9}})

   msginfo("O aluno " + aArray[2,1] + " realizou quatro provas com as notas: " + cValToChar(aArray[2,2,1]) + ", " + cValToChar(aArray[2,2,2]) + ", " + cValToChar(aArray[2,2,3]) + " e " + cValToChar(aArray[2,2,4]))
Return