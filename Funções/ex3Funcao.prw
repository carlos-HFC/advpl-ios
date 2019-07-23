#include "Protheus.ch"

User Function funVetor()
    local aVetor := {}
    local cMen := ''
    u_retVetor(@aVetor)

    aSort(aVetor, , , {|x,y|x > y})
    
    For nX := 1 to Len(aVetor)
        cMen += cValToChar(aVetor[nX]) + CRLF
    Next
    
    msginfo(cMen)
Return

User Function retVetor(aVetor)
    aVetor := {}
    aAdd(aVetor, 100)
    aAdd(aVetor, 2)
    aAdd(aVetor, 5)
    aAdd(aVetor, 58)
    aAdd(aVetor, -4)
Return aVetor