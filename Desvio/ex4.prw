#include 'Protheus.ch'

//Desconto de um produto
User Function desconto()
   local cProd := ''
   local nQtde := nPreco := nTotal := nPagar := 0
   local nDesconto := 0

   cProd := FWInputBox("Digite o nome do produto")
   nQtde := Val(FWInputBox("Digite a quantidade adquirida do produto"))
   nPreco := Val(FWInputBox("Digite o preco unitario do produto"))

   nTotal := nQtde * nPreco
   alert("O valor total do(a) " + cProd + " será de R$" + cValToChar(nTotal))

   Do Case
      Case nQtde <= 5
         nDesconto := nTotal * 0.02
      Case nQtde > 5 .AND. nQtde <= 10
         nDesconto := nTotal * 0.03
      Otherwise
         nDesconto := nTotal * 0.05
   EndCase

   nPagar := nTotal - nDesconto
   alert("O desconto será de R$" + cValToChar(nDesconto) + ". O valor total a pagar do(a) " + cProd + " será de R$" + cValToChar(nPagar)) 
Return 