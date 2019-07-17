#include "Protheus.ch"

User Function salaAr
   local aArray := {}

   aAdd(aArray, "Carlos")
   aAdd(aArray, "Ygor")
   aAdd(aArray, "Bruno")
   aAdd(aArray, "Brigit")
   aAdd(aArray, "Riquelme")
   aAdd(aArray, "Lucas")
   aAdd(aArray, "Igor")
   aAdd(aArray, "Ualace")
   aAdd(aArray, "Amarelo")
   aAdd(aArray, "Juliane")
   aAdd(aArray, "Ricardo")

   aDel(aArray, 2)
   aDel(aArray, 4)
   aDel(aArray, 6)
   aDel(aArray, 8)
   aDel(aArray, 10)

   aSize(aArray, 5)

   VarInfo("k", aArray)
Return