#include "Protheus.ch"

//Colocar números de zero a dez em forma crescente
User Function ordCresc()
    local nNumero := 0
    local nCont := 1
    local cMen := ''
    local aNumeros := {}

    While (nNumero < 10)        
        nNumero++
        aAdd(aNumeros, nNumero)
    EndDo

    For nCont := 1 to Len(aNumeros)
        cMen += (cValToChar(aNumeros[nCont]) + CRLF)
    Next    

    msgalert(cMen)    
Return 