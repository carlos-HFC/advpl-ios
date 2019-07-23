#include "Protheus.ch"

User Function ideal()
    local aPessoas := {}
    local cMen := ''
    local nX := 1

    aAdd(aPessoas, {1.77, 'M', 0})
    aAdd(aPessoas, {2.00, 'M', 0})
    aAdd(aPessoas, {1.60, 'F', 0})
    aAdd(aPessoas, {1.25, 'F', 0})
    aAdd(aPessoas, {1.84, 'M', 0})
    aAdd(aPessoas, {1.98, 'F', 0})

    For nX := 1 to Len(aPessoas)
        aPessoas[nX,3] := u_IMC(aPessoas[nX,1], aPessoas[nX,2])
        cMen += i18n("A pessoa #1 tem #2 de altura. Seu peso ideal é: #3" + CRLF, {cValToChar(nX), STR(aPessoas[nX,1], 5, 2), STR(aPessoas[nX,3], 6, 2)})
    Next nX

    msginfo(cMen)
Return