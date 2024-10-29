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

gen multicnj = 0 if ehcnj == 1 & oo != .
replace multicnj = 1 if ehcnj == 1 & od != .
replace multicnj = 2 if ehcnj == 1 & oi != .
replace multicnj = 3 if ehcnj == 1 & do != .
replace multicnj = 4 if ehcnj == 1 & dd != .
replace multicnj = 5 if ehcnj == 1 & di != .
replace multicnj = 6 if ehcnj == 1 & io != .
replace multicnj = 7 if ehcnj == 1 & id != .
replace multicnj = 8 if ehcnj == 1 & ii != .

mlogit multicnj chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj.xls" , replace










* Filho *

gen multiflh = 0 if ehflh == 1 & oo != .
replace multiflh = 1 if ehflh == 1 & od != .
replace multiflh = 2 if ehflh == 1 & oi != .
replace multiflh = 3 if ehflh == 1 & do != .
replace multiflh = 4 if ehflh == 1 & dd != .
replace multiflh = 5 if ehflh == 1 & di != .
replace multiflh = 6 if ehflh == 1 & io != .
replace multiflh = 7 if ehflh == 1 & id != .
replace multiflh = 8 if ehflh == 1 & ii != .

mlogit multiflh chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 , vce(robust) b(0)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh.xls" , replace
