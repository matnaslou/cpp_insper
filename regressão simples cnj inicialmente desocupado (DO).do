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


gen ehchf = 1 if V2005 == 1 
gen ehcnj = 1 if (V2005==2|V2005==3) 
gen ehflh = 1 if V2005>=4&V2005<=7&V2009>=14&V2009<=22 

bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen entrevista = seq() 
replace entrevista = . if UPA[_n-1] == UPA & V1008[_n-1] == V1008 & V1014[_n-1] == V1014 & V2007[_n-1] == V2007 & V2008[_n-1] == V2008 & V20081[_n-1] == V20081 & V20082[_n-1] == V20082 & per[_n-1] != per - 1 // Marcando quem pulou uma entrevista
gen invalido = 1 if entrevista == . 
bysort UPA V1008 V1014 V2007 V2008 V20081 V20082: egen inv = total(invalido) , missing // Tornando os indivíduos que pularam entrevistas em inválidos
replace inv = 1 if inv == 2



replace ehchf = . if inv == 1
replace ehcnj = . if inv == 1
replace ehflh = . if inv == 1

bysort UPA V1008 V1014 per: egen temcnj = total(ehcnj) , missing
bysort UPA V1008 V1014 per: egen temflh = total(ehflh) , missing
replace temflh = 1 if temflh != . 
gen chfdes = 1 if ehchf == 1 & (od!=.|oi!=.)
replace chfdes = 0 if ehchf == 1 & (oo!=.)	
bysort UPA V1008 V1014 per: egen chfdesemp = total(chfdes) , missing



gen cnjdes = 0 if ehcnj == 1 & (dd != . | di != .)
replace cnjdes = 1 if ehcnj == 1 & (do != . )


* Dummy de ano *
gen dmano12 = 0 
replace dmano12 = 1 if Ano == 2012
gen dmano13 = 0
replace dmano13 = 1 if Ano == 2013 
gen dmano14 = 0
replace dmano14 = 1 if Ano == 2014
gen dmano15 = 0
replace dmano15 = 1 if Ano == 2015
gen dmano16 = 0
replace dmano16 = 1 if Ano == 2016
gen dmano17 = 0
replace dmano17 = 1 if Ano == 2017 
gen dmano18 = 0
replace dmano18 = 1 if Ano == 2018




regress cnjdes chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\regressões.xls" , replace

tab cnjdes if temflh == 1 & chfdesemp != .

