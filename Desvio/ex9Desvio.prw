#include "Protheus.ch"

User Function posto()
   local nLitros := nDesconto := 0
   local nPrecoGas := 3.30
   local nPrecoAlc := 2.90
   local cCombustivel := ''

   cCombustivel := FWInputBox("Qual combustível abastecerá?" + CRLF + "Escolha G, para gasolina, e A, para álcool")
   nLitros := Val(FWInputBox("Quantos litros abastecerá??"))

   Do Case
   
   EndCase

Return