#include "Protheus.ch"

user Function dezCem()
    local nNumero := 0
    local nBase := 100

    While (nBase >= 100 .and. nBase <= 110)
        msginfo(cValToChar(nBase))
        nBase++
    EndDo    
Return 