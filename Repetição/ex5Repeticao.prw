#include "Protheus.ch"

//Colocar os pr�ximos dez n�meros inteiros ap�s o cem
user Function dezCem()
    local nNumero := 0
    local nBase := 100

    While (nBase >= 100 .and. nBase <= 110)
        msginfo(cValToChar(nBase))
        nBase++
    EndDo    
Return 