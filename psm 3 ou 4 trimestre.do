drop multinomialflhD multinomialflhO multinomialflhI multinomialcnjD multinomialcnjO multinomialcnjI
sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
gen multinomialflhD = 0 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 2 & (VD4002[_n+2] == 2 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialflhD = 1 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 2 & (VD4002[_n+2] == 1 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialflhD = 2 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 2 & (VD4002[_n+2] == . & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)

sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
gen multinomialflhO = 0 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 1 & (VD4002[_n+2] == 1 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialflhO = 1 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 1 & (VD4002[_n+2] == 2 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialflhO = 2 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 1 & (VD4002[_n+2] == . & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)

sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
gen multinomialflhI = 0 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == . & (VD4002[_n+2] == . & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialflhI = 1 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == . & (VD4002[_n+2] == 1 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialflhI = 2 if ehflh == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == . & (VD4002[_n+2] == 2 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)

mlogit multinomialflhD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != . & (entrevista == 2 | entrevista == 3 | entrevista == 4)  , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh D pos PSM do 3º para 4º Trim.xls" , replace

mlogit multinomialflhO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != . & (entrevista == 2 | entrevista == 3 | entrevista == 4) , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh O pos PSM do 3º para 4º Trim.xls" , replace

mlogit multinomialflhI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != . & (entrevista == 2 | entrevista == 3 | entrevista == 4) , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh I pos PSM do 3º para 4º Trim.xls" , replace



gen multinomialcnjD = 0 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 2 & (VD4002[_n+2] == 2 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialcnjD = 1 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 2 & (VD4002[_n+2] == 1 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialcnjD = 2 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 2 & (VD4002[_n+2] == . & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)

sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
gen multinomialcnjO = 0 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 1 & (VD4002[_n+2] == 1 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialcnjO = 1 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 1 & (VD4002[_n+2] == 2 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialcnjO = 2 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == 1 & (VD4002[_n+2] == . & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)

sort UPA V1008 V1014 V2007 V2008 V20081 V20082 per
gen multinomialcnjI = 0 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == . & (VD4002[_n+2] == . & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialcnjI = 1 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == . & (VD4002[_n+2] == 1 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)
replace multinomialcnjI = 2 if ehcnj == 1 & (entrevista == 2 | entrevista == 3) & Trimestre == 2 & VD4002 == . & (VD4002[_n+2] == 2 & UPA == UPA[_n+2] & V1008 == V1008[_n+2] & V1014 == V1014[_n+2] & V2003 == V2003[_n+2] & V2008 == V2008[_n+2] & ///
V20081 == V20081[_n+2] & V20082 == V20082[_n+2] & per == per[_n+2] - 2)

mlogit multinomialcnjD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . & (entrevista == 2 | entrevista == 3 | entrevista == 4)  , vce(robust) baseoutcome(0)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj D pos PSM do 3º para 4º Trim.xls" , replace

mlogit multinomialcnjO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . & (entrevista == 2 | entrevista == 3 | entrevista == 4) , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj O pos PSM do 3º para 4º Trim.xls" , replace

mlogit multinomialcnjI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . & (entrevista == 2 | entrevista == 3 | entrevista == 4) , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj I pos PSM do 3º para 4º Trim.xls" , replace

