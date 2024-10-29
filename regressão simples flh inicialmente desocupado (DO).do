gen flhdes = 0 if ehflh == 1 & (dd != . | di != .)
replace flhdes = 1 if ehflh == 1 & (do != . )


regress flhdes chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\regressõesflh.xls" , replace
