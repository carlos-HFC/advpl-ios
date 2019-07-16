#include 'Protheus.ch'

//Desconto de um produto
User Function desconto()
   local cProd := ''
   local nQtde := nPreco := nTotal := nPagar := 0

   cProd := FWInputBox("Digite o nome do produto")
   nQtde := Val(FWInputBox("Digite a quantidade adquirida do produto"))
   nPreco := Val(FWInputBox("Digite o preco unitario do produto"))

   nTotal := nQtde * nPreco
   alert("O valor total do(a) " + cProd + " sera R$" + cValToChar(nTotal))

   If nQtde <= 5
      nPagar := nTotal - (nPreco * 0.02)
      alert("O desconto sera de R$" + cValToChar(nPreco * 0.02) + ". O total a pagar do(a) " + cProd + " sera R$" + cValToChar(nPagar))
   ElseIf nQtde > 5 .AND. nQtde <= 10
      nPagar := nTotal - (nPreco * 0.03)
      alert("O desconto sera de R$" + cValToChar(nPreco * 0.03) + ". O total a pagar do(a) " + cProd + " sera R$" + cValToChar(nPagar))
   ElseIf nQtde > 10
      nPagar := nTotal - (nPreco * 0.05)
      alert("O desconto sera de R$" + cValToChar(nPreco * 0.05) + ". O total a pagar do(a) " + cProd + " sera R$" + cValToChar(nPagar))
   EndIf   
Return 