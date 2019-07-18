#include "Protheus.ch"

User Function fiveAl()
   local aAluno := {}

   aAdd(aAluno, {"Carlos"})
   aAdd(aAluno, {"Bruno"})
   aAdd(aAluno, {"Klinton"})
   aAdd(aAluno, {"Ygor"})
   aAdd(aAluno, {"Riquelme"})

   msginfo("Nome do aluno: " + aAluno[3][1])
Return