* Regressões usando os controles e tratamentos *

mlogit multinomialflhD chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh D pos PSM2.xls" , replace

mlogit multinomialflhO chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh O pos PSM2.xls" , replace

mlogit multinomialflhI chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh I pos PSM2.xls" , replace

mlogit multinomialcnjD chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temflh == 1 & _weight != . , vce(robust) baseoutcome(0)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj D pos PSM2.xls" , replace

mlogit multinomialcnjO chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temflh == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj O pos PSM2.xls" , replace

mlogit multinomialcnjI chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temflh == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj I pos PSM2.xls" , replace
