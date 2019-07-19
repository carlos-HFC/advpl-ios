#include "Protheus.ch"

user Function letras()
    local aLetras := {'A', 'B', 'C', 'F', 'E'}
    local nX, nTotal := nResult := 0

    For nX := 1 to Len(aLetras)
        If aLetras[nX] != 'F'
            nTotal++
        Else
            Exit      
        EndIf 
    Next nX

    For nX := 1 to Len(aLetras)
        nResult++
    Next nX
    
    nResult--

    msgalert(nTotal)
    msgalert(nResult - nTotal)
Return