* Regressões usando os controles e tratamentos *

mlogit multinomialflhD chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
margins ,dydx(chfdesemp)
matrix A = r(b)
mlogit multinomialcnjD chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temflh == 1 & _weight != . , vce(robust) baseoutcome(0)
margins ,dydx(chfdesemp)
matrix B = r(b)
mlogit multinomialflhI chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
margins ,dydx(chfdesemp)
matrix C = r(b)
mlogit multinomialcnjI chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temflh == 1 & _weight != . , vce(robust) baseoutcome(0)
margins ,dydx(chfdesemp)
matrix D = r(b)
mlogit multinomialflhO chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
margins ,dydx(chfdesemp)
matrix E = r(b)
mlogit multinomialcnjO chfdesemp dmano* dUF* V2007 V2009 raca VD3005 totalhab urbano metropolitano [iw=V1028] if temflh == 1 & _weight != . , vce(robust) baseoutcome(0)
margins ,dydx(chfdesemp)
matrix F = r(b)

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\margins psm.xlsx" , modify sheet(Planilha)
putexcel B3 = matrix(B)
putexcel B4 = matrix(C)
putexcel B5 = matrix(D)
