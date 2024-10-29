sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen entrevista = seq() 
replace entrevista = . if UPA[_n-1] == UPA & V1008[_n-1] == V1008 & V1014[_n-1] == V1014 & V2007[_n-1] == V2007 & V2008[_n-1] == V2008 & V20081[_n-1] == V20081 & V20082[_n-1] == V20082 & per[_n-1] != per - 1 // Marcando quem pulou uma entrevista
gen invalido = 1 if entrevista == . 
bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen inv = total(invalido) , missing // Tornando os indivíduos que pularam entrevistas em inválidos
replace inv = 1 if inv == 2

sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
   * a) Situação OO:
	    by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen oo = 0 if  VD4002 == 1 & VD4002[_n+1] == 1 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace oo =`m' if VD4002 == 1 & VD4002[_n+1] == 1 & per == `m' & per[_n+1] == `m' + 1
		}
   * b) Situação OD:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen od = 0 if  VD4002 == 1 & VD4002[_n+1] == 2 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace od =`m' if VD4002 == 1 & VD4002[_n+1] == 2 & per == `m' & per[_n+1] == `m' + 1
		}
   * c) Situação OI:		
	    by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen oi = 0 if  VD4002 == 1 & VD4002[_n+1] == . & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace oi =`m' if VD4002 == 1 & VD4002[_n+1] == . & per == `m' & per[_n+1] == `m' + 1
		}
   * d) Situação DO:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen do = 0 if  VD4002 == 2 & VD4002[_n+1] == 1 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace do =`m' if VD4002 == 2 & VD4002[_n+1] == 1 & per == `m' & per[_n+1] == `m' + 1
		}
   * e) Situação DD:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen dd = 0 if  VD4002 == 2 & VD4002[_n+1] == 2 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace dd =`m' if VD4002 == 2 & VD4002[_n+1] == 2 & per == `m' & per[_n+1] == `m' + 1
		}
   * f) Situação DI:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen di = 0 if  VD4002 == 2 & VD4002[_n+1] == . & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace di =`m' if VD4002 == 2 & VD4002[_n+1] == . & per == `m' & per[_n+1] == `m' + 1
		}
   * g) Situação IO:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen io = 0 if  VD4002 == . & VD4002[_n+1] == 1 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace io =`m' if VD4002 == . & VD4002[_n+1] == 1 & per == `m' & per[_n+1] == `m' + 1
		}
   * h) Situação ID:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen id = 0 if  VD4002 == . & VD4002[_n+1] == 2 & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace id =`m' if VD4002 == . & VD4002[_n+1] == 2 & per == `m' & per[_n+1] == `m' + 1
		}
   * i) Situação II:
        by UPA V1008 V1014 V2007 V2008 V20081 V20082: gen ii = 0 if  VD4002 == . & VD4002[_n+1] == . & per == 0 & per[_n+1] == 1 // De 0 para 1
		foreach m in 1 2 3 4 5 6 7 8 9 10 11 12 13 10 11 12 13 14 15 18 19 20 21 22 23 24 25 26 27 {
		by UPA V1008 V1014 V2007 V2008 V20081 V20082: replace ii =`m' if VD4002 == . & VD4002[_n+1] == . & per == `m' & per[_n+1] == `m' + 1
		}


gen ehchf2 = 1 if V2005 == 1
gen ehcnj2 = 1 if V2005==2|V2005==3
gen ehflh2 = 1 if V2005>=4&V2005<=7&V2009>=14&V2009<=22
replace ehchf2 = . if per != 13 
replace ehcnj2 = . if per != 13
replace ehflh2 = . if per != 13

bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen chfvalido = total(ehchf2), missing
bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen cnjvalido = total(ehcnj2), missing
bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen flhvalido = total(ehflh2), missing

gen chfdes = 1 if chfvalido == 1 & (od==13|oi==13)
gen chfemp = 1 if chfvalido == 1 & (oo==13)	
bysort UPA V1008 V1014: egen dchf = total(chfdes) , missing
bysort UPA V1008 V1014: egen echf = total(chfemp) , missing	

bysort UPA V1008 V1014: egen temcnj = total(ehcnj2) , missing
bysort UPA V1008 V1014: egen temflh = total(ehflh2) , missing
replace temflh = 1 if temflh != . 
