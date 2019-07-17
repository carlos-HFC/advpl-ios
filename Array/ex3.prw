#include "Protheus.ch"

User Function addAluno()
   local aAluno := {}

   aAdd(aAluno, {"Amarelo", 7, 87, "Programador Cobol"})
   aAdd(aAluno, {"Lucas 1", 10, 12, "Jogador de CS"})
   aAdd(aAluno, {"Wualace", 2, 30, "Instrutor"})
   aAdd(aAluno, {"Castanhari", 0.1, 23, "Youtuber"})
   aAdd(aAluno, {"Igor RS", 6, 24, "do Sul"})

   msginfo("Nome do aluno: " + aAluno[5][1] +;
            " Média: " + cValToChar(aAluno[5][2]) +;
            " Idade: " + cValToChar(aAluno[5][3]) +;
            " Profissão: " + aAluno[5][4])
Return