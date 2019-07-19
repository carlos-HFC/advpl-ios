#include "Protheus.ch"

user Function arLetras()
    local aLetras := {'A', 'B', 'C', 'D', 'A', 'G', 'B', 'O'}
    local nX, nTotal := 0

    For nX := 1 to Len(aLetras)
        If aLetras[nX] <> 'A' .and. aLetras[nX] <> 'B'
            nTotal++            
        EndIf
    Next nX
    msgalert(nTotal)    
Return