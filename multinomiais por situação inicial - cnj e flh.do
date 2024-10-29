gen multinomialflhD = 0 if ehflh == 1 & dd != .
replace multinomialflhD = 1 if ehflh == 1 & do != .
replace multinomialflhD = 2 if ehflh == 1 & di != .

mlogit multinomialflhD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh D" , replace


gen multinomialflhO = 0 if ehflh == 1 & oo != .
replace multinomialflhO = 1 if ehflh == 1 & od != .
replace multinomialflhO = 2 if ehflh == 1 & oi != .

mlogit multinomialflhO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh O" , replace

gen multinomialflhI = 0 if ehflh == 1 & ii != .
replace multinomialflhI = 1 if ehflh == 1 & io != .
replace multinomialflhI = 2 if ehflh == 1 & id != .

mlogit multinomialflhI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh I" , replace






gen multinomialcnjD = 0 if ehcnj == 1 & dd != .
replace multinomialcnjD = 1 if ehcnj == 1 & do != .
replace multinomialcnjD = 2 if ehcnj == 1 & di != .

mlogit multinomialcnjD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj D" , replace


gen multinomialcnjO = 0 if ehcnj == 1 & oo != .
replace multinomialcnjO = 1 if ehcnj == 1 & od != .
replace multinomialcnjO = 2 if ehcnj == 1 & oi != .

mlogit multinomialcnjO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj O" , replace

gen multinomialcnjI = 0 if ehcnj == 1 & ii != .
replace multinomialcnjI = 1 if ehcnj == 1 & io != .
replace multinomialcnjI = 2 if ehcnj == 1 & id != .

mlogit multinomialcnjI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj I" , replace
