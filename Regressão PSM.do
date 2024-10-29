sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
   * a) Situação OO:
	    by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen oo = 0 if  VD4002 == 1 & VD4002[_n+1] == 1 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace oo =`m' if VD4002 == 1 & VD4002[_n+1] == 1 & per == `m' & per[_n+1] == `m' + 1
		}
   * b) Situação OD:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen od = 0 if  VD4002 == 1 & VD4002[_n+1] == 2 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace od =`m' if VD4002 == 1 & VD4002[_n+1] == 2 & per == `m' & per[_n+1] == `m' + 1
		}
   * c) Situação OI:		
	    by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen oi = 0 if  VD4002 == 1 & VD4002[_n+1] == . & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace oi =`m' if VD4002 == 1 & VD4002[_n+1] == . & per == `m' & per[_n+1] == `m' + 1
		}
   * d) Situação DO:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen do = 0 if  VD4002 == 2 & VD4002[_n+1] == 1 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace do =`m' if VD4002 == 2 & VD4002[_n+1] == 1 & per == `m' & per[_n+1] == `m' + 1
		}
   * e) Situação DD:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen dd = 0 if  VD4002 == 2 & VD4002[_n+1] == 2 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace dd =`m' if VD4002 == 2 & VD4002[_n+1] == 2 & per == `m' & per[_n+1] == `m' + 1
		}
   * f) Situação DI:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen di = 0 if  VD4002 == 2 & VD4002[_n+1] == . & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace di =`m' if VD4002 == 2 & VD4002[_n+1] == . & per == `m' & per[_n+1] == `m' + 1
		}
   * g) Situação IO:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen io = 0 if  VD4002 == . & VD4002[_n+1] == 1 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace io =`m' if VD4002 == . & VD4002[_n+1] == 1 & per == `m' & per[_n+1] == `m' + 1
		}
   * h) Situação ID:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen id = 0 if  VD4002 == . & VD4002[_n+1] == 2 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace id =`m' if VD4002 == . & VD4002[_n+1] == 2 & per == `m' & per[_n+1] == `m' + 1
		}
   * i) Situação II:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen ii = 0 if  VD4002 == . & VD4002[_n+1] == . & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace ii =`m' if VD4002 == . & VD4002[_n+1] == . & per == `m' & per[_n+1] == `m' + 1
		}


gen ehchf2 = 1 if V2005 == 1 
gen ehcnj2 = 1 if (V2005==2|V2005==3) 
gen ehflh2 = 1 if V2005>=4&V2005<=7&V2009>=14&V2009<=22 

bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen entrevista = seq() 
replace entrevista = . if UPA[_n-1] == UPA & V1008[_n-1] == V1008 & V1014[_n-1] == V1014 & V2007[_n-1] == V2007 & V2008[_n-1] == V2008 & V20081[_n-1] == V20081 & V20082[_n-1] == V20082 & per[_n-1] != per - 1 // Marcando quem pulou uma entrevista
gen invalido = 1 if entrevista == . 
bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen inv = total(invalido) , missing // Tornando os indivíduos que pularam entrevistas em inválidos
replace inv = 1 if inv == 2



replace ehchf2 = . if (per != 1 & per != 5 & per != 9 & per != 13 & per != 17 & per != 21 & per != 25 & per != 29) | inv == 1
replace ehcnj2 = . if (per != 1 & per != 5 & per != 9 & per != 13 & per != 17 & per != 21 & per != 25 & per != 29) | inv == 1
replace ehflh2 = . if (per != 1 & per != 5 & per != 9 & per != 13 & per != 17 & per != 21 & per != 25 & per != 29) | inv == 1

bysort UPA V1008 V1014 per: egen temcnj = total(ehcnj2) , missing
bysort UPA V1008 V1014 per: egen temflh = total(ehflh2) , missing
replace temflh = 1 if temflh != . 
gen chfdes = 1 if ehchf2 == 1 & (od!=.|oi!=.)
replace chfdes = 0 if ehchf2 == 1 & (oo!=.)	
bysort UPA V1008 V1014: egen chfdesemp = total(chfdes) , missing
gen cnjativo = 0 if ehcnj2 == 1 & (ii != .)
replace cnjativo = 1 if ehcnj2 == 1 & (io != . | id != .)
gen flhativo = 0 if ehflh2 == 1 & ii != .
replace flhativo = 1 if ehflh2 == 1 & (io != . | id != .)



foreach n in 1 5 9 13 17 21 25 {
regress cnjativo chfdesemp [iw=V1028] if per == `n' & temflh == 1 , vce(robust)
if `n' == 1 {
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\regressões.xls" , replace ctitle(2012/2)
}
else outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\regressões.xls" , append 
tab cnjativo [iw=V1028] if temflh == 1 & per == `n' & chfdesemp != .
}


foreach n in 1 5 9 13 17 21 25 {
regress flhativo chfdesemp [iw=V1028] if per == `n' & temcnj == 1 , vce(robust)
if `n' == 1 {
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\regressõesflh.xls" , replace ctitle(2012/2)
}
else outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\regressõesflh.xls" , append 
tab flhativo if temcnj == 1 & per == `n' & chfdesemp != .
}



set seed 654654
gen v=uniform()
sort v
psmatch2

* regressão do tipo: cnjAtivo == 1 e cnjInativo == 0 vs chf perder ou nao o emprego no segundo trimestre de cada ano * * Fazer tab com o total de cnjs que fazem cada tipo de migração para cada tipo de transição do chefe *
