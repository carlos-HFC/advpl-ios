#include "Protheus.ch"

User Function array3_2
   local aArray := {}

   aAdd(aArray, {"Carlos", 22})
   aAdd(aArray, {"Brigit", 12})
   aAdd(aArray, {"Ygor", 22})

   msginfo("A aluna " + aArray[2,1] + " tem " + cValToChar(aArray[2,2]) + " anos.")
Return 