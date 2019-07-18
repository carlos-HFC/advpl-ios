#include 'Protheus.ch'

//Cálculo - Teorema de Pitágoras
User Function pitagoras()
   local nA := nB := nC := 0

   nB := Val(FWInputBox("Digite o valor do cateto adjacente"))
   nC := Val(FWInputBox("Digite o valor do cateto oposto"))

   nA := (nB^2) + (nC^2)

   alert('O valor da hipotenusa é ' + cValToChar(nA^2))
Return