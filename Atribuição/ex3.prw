#include 'Protheus.ch'

//Média do aluno
User Function media()
   Local nNum1 := nNum2 := nNum3 := nMedia := 0  
   local cNome := ''

   cNome := FWInputBox("Digite o nome do aluno")
   nNum1 := Val(FWInputBox("Digite a primeira nota"))
   nNum2 := Val(FWInputBox("Digite a segunda nota"))
   nNum3 := Val(FWInputBox("Digite a terceira nota"))

   nMedia := ((nNum1 * 2) + (nNum2 * 3) + (nNum3 * 5)) / 10

   alert('A media final do ' + cNome + ' foi ' + cValToChar(nMedia))
Return