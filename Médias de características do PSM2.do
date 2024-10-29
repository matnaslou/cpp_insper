dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano

* médias dessas características em domicílios que o cnj/flh trabalhava no 2º trim e em domicílios em que estava inativo *
gen cnj_eraativo = 1 if ehcnj == 1 & VD4002 == 1 & Trimestre == 2
gen flh_eraativo = 1 if ehflh == 1 & VD4002 == 1 & Trimestre == 2
replace cnj_eraativo = 0 if ehcnj == 1 & VD4002 == . & Trimestre == 2
replace flh_eraativo = 0 if ehflh == 1 & VD4002 == . & Trimestre == 2

bysort UPA V1008 V1014 per: egen cnj_ativo = total(cnj_eraativo) , missing
bysort UPA V1008 V1014 per: egen flh_ativo = total(flh_eraativo) , missing



* 1) Idade:
gen idade = V2009 if (ehchf == 1 | ehcnj == 1 | ehflh == 1)
tabstat idade [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) ,  save // Com Peso 
matrix A = r(StatTotal)
tabstat idade [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))), save // Sem Peso
matrix A2 = r(StatTotal)
tabstat idade [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0), save // Com Peso
matrix A3 = r(StatTotal)
tabstat idade [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 0 & flh_ativo == 0), save // Sem Peso
matrix A4 = r(StatTotal)
* 2) Urbano
tabstat urbano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))), save  // Com Peso
matrix B = r(StatTotal)
tabstat urbano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))), save  // Sem Peso
matrix B2 = r(StatTotal)
tabstat urbano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0) , save // Com Peso
matrix B3 = r(StatTotal)
tabstat urbano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 0 & flh_ativo == 0), save  // Sem Peso
matrix B4 = r(StatTotal)
* 3) Anos de Estudo
gen ae = VD3005 if (ehchf == 1 | ehcnj == 1 | ehflh == 1)
tabstat ae [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Com Peso
matrix C = r(StatTotal)
tabstat ae [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Sem Peso
matrix C2 = r(StatTotal)
tabstat ae [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0) , save // Com Peso
matrix C3 = r(StatTotal)
tabstat ae [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 0 & flh_ativo == 0) , save // Sem Peso
matrix C4 = r(StatTotal)
* 4) Quantidade de brancos/amarelos:
gen branco = 1 if (ehchf == 1 | ehcnj == 1 | ehflh == 1) & raca == 0 
bysort UPA V1008 V1014 per: egen totbranco = total(branco) , missing
replace totbranco = . if V2005 != 1
gen perbranco = totbranco/totalhab

tabstat perbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Com Peso
matrix D = r(StatTotal)
tabstat perbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Sem Peso
matrix D2 = r(StatTotal)
tabstat perbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0) , save // Com Peso
matrix D3 = r(StatTotal)
tabstat perbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 0 & flh_ativo == 0) , save // Sem Peso
matrix D4 = r(StatTotal)
* 5) Quantidade de Pretos/Pardos/Indígenas:
gen ñbranco = 1 if (ehchf == 1 | ehcnj == 1 | ehflh == 1) & raca == 1 
bysort UPA V1008 V1014 per: egen totñbranco = total(ñbranco) , missing
replace totñbranco = . if V2005 != 1
gen perñbranco = totñbranco/totalhab

tabstat perñbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Com Peso
matrix E = r(StatTotal)
tabstat perñbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Sem Peso
matrix E2 = r(StatTotal)
tabstat perñbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0) , save // Com Peso
matrix E3 = r(StatTotal)
tabstat perñbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & (cnj_ativo == 0 & flh_ativo == 0) , save // Sem Peso
matrix E4 = r(StatTotal)
* 6) Metropolitano
tabstat metropolitano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Com Peso
matrix F = r(StatTotal)
tabstat metropolitano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1  & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save // Sem Peso
matrix F2 = r(StatTotal)
tabstat metropolitano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0) , save // Com Peso
matrix F3 = r(StatTotal)
tabstat metropolitano [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1  & (cnj_ativo == 0 & flh_ativo == 0) , save // Sem Peso
matrix F4 = r(StatTotal)
* 7) UF
tabstat dUF* [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0))) , save

tabstat dUF* [w=V1028] if V2005 == 1 & Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0) , save


putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Médias com ou sem PSM comparadas.xlsx" , sheet(Médias com ou sem Peso) modify
// idade
putexcel C2 = matrix(A)
putexcel D2 = matrix(A2)
putexcel C3 = matrix(A3)
putexcel D3 = matrix(A4)
// ae
putexcel C4 = matrix(C)
putexcel D4 = matrix(C2)
putexcel C5 = matrix(C3)
putexcel D5 = matrix(C4)
// brancos/amarelos
putexcel C6 = matrix(D)
putexcel D6 = matrix(D2)
putexcel C7 = matrix(D3)
putexcel D7 = matrix(D4)
// pretos/pardos/indígenas
putexcel C8 = matrix(E)
putexcel D8 = matrix(E2)
putexcel C9 = matrix(E3)
putexcel D9 = matrix(E4)
// urbano
putexcel C10 = matrix(B)
putexcel D10 = matrix(B2)
putexcel C11 = matrix(B3)
putexcel D11 = matrix(B4)
// metropolitano
putexcel C12 = matrix(F)
putexcel D12 = matrix(F2)
putexcel C13 = matrix(F3)
putexcel D13 = matrix(F4)
