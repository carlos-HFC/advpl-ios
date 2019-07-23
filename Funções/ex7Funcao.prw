#include "Protheus.ch"

user Function salario()
    local cMen := ''
    local aVetor := {}
    local nX := 1
    local nRet := 0
    u_calculo(@aVetor)

    For nX := 1 to Len(aVetor)
        nRet := u_calculo(aVetor, aVetor[nX,2], aVetor[nX,3])
        cMen += i18n("O funcionário #1 recebe R$ #2 bruto e R$ #3 líquido" + CRLF, {aVetor[nx,1], STR(aVetor[nX,2], 7, 2), STR(aVetor[nX,3], 7, 2)})
    Next nX

    msginfo(cMen)
Return

user Function calculo(aVetor, nSB, nSL)
    local nINSS := 0
    local nHoras := 10.00
    local nTrab := 184
    nSB := nTrab * nHoras
    nINSS := nSB * 0.08
    nSL := nSB - nINSS
    aVetor := {}

    aAdd(aVetor, {"Carlos", nSB, nSL})
    aAdd(aVetor, {"Bruno", nSB, nSL})
    aAdd(aVetor, {"Ygor", nSB, nSL})
    aAdd(aVetor, {"Klinton", nSB, nSL})
    aAdd(aVetor, {"Riquelme", nSB, nSL})
Return aVetor