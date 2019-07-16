#include 'Protheus.ch'

User Function salario()
   local cCod := cNome := ''
   local nBruto := nLiquido := 0

   cCod := FWInputBox("Insira o código do funcionário")
   cNome := FWInputBox("Insira o nome do funcionário")
   nBruto := Val(FWInputBox("Insira o salário bruto do funcionário"))

   nLiquido := nBruto * 0.15

   alert('O salário líquido de ' + cNome + ' é R$' + cValToChar(nLiquido))
Return 