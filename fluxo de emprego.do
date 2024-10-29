drop descarte
gen chf = 1 if UPA == UPA[_n+1] & V1008 == V1008[_n+1] & V1014 == V1014[_n+1] & V2007 == V2007[_n+1] & V2008 == V2008[_n+1] & ///
V20081 == V20081[_n+1] & V20082 == V20082[_n+1] & V2005 == 1 & Ano == 2015 & Trimestre == 2

replace chf = 1 if UPA == UPA[_n-1] & V1008 == V1008[_n-1] & V1014 == V1014[_n-1] & V2007 == V2007[_n-1] & V2008 == V2008[_n-1] & ///
V20081 == V20081[_n-1] & V20082 == V20082[_n-1] & V2005[_n-1] == 1 & Ano == 2015 & Trimestre == 3 

gen cnj = 1 if UPA == UPA[_n+1] & V1008 == V1008[_n+1] & V1014 == V1014[_n+1] & V2007 == V2007[_n+1] & V2008 == V2008[_n+1] & ///
V20081 == V20081[_n+1] & V20082 == V20082[_n+1] & (V2005 == 2 | V2005 == 3) & Ano == 2015 & Trimestre == 2

replace cnj = 1 if UPA == UPA[_n-1] & V1008 == V1008[_n-1] & V1014 == V1014[_n-1] & V2007 == V2007[_n-1] & V2008 == V2008[_n-1] & ///
V20081 == V20081[_n-1] & V20082 == V20082[_n-1] & (V2005[_n-1] == 2 | V2005[_n-1] == 3) & Ano == 2015 & Trimestre == 3 

gen filho = 1 if UPA == UPA[_n+1] & V1008 == V1008[_n+1] & V1014 == V1014[_n+1] & V2007 == V2007[_n+1] & V2008 == V2008[_n+1] & ///
V20081 == V20081[_n+1] & V20082 == V20082[_n+1] & (ehflh == 1) & Ano == 2015 & Trimestre == 2

replace filho = 1 if UPA == UPA[_n-1] & V1008 == V1008[_n-1] & V1014 == V1014[_n-1] & V2007 == V2007[_n-1] & V2008 == V2008[_n-1] & ///
V20081 == V20081[_n-1] & V20082 == V20082[_n-1] & (ehflh[_n-1] == 1) & Ano == 2015 & Trimestre == 3 

gen descartado = 1 if UPA == UPA[_n+1] & V1008 == V1008[_n+1] & V1014 == V1014[_n+1] & V2007 == V2007[_n+1] & V2008 == V2008[_n+1] & V20081 == V20081[_n+1] & V20082 == V20082[_n+1] & per + 1 != per[_n+1] 
 

tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == 1  & entrevista != 5 & descartado == . , matcell(A)  // chefes ocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == 2  & entrevista != 5 & descartado == . , matcell(B)  // chefes desocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == .  & entrevista != 5 , matcell(C)  // chefes inativos
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == 1  & entrevista != 5 & descartado == . , matcell(D)  // cônjuges ocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == 2  & entrevista != 5 & descartado == . , matcell(E)  // cônjuges desocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == .  & entrevista != 5 & descartado == . , matcell(F)  // cônjuges inativos
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == 1  & entrevista != 5 & descartado == . , matcell(G)  // filhos ocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == 2   & entrevista != 5 & descartado == . , matcell(H) // filhos desocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & VD4002 == .  & entrevista != 5& descartado == .  , matcell(I)  // filhos inativos

tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == 1  & descartado == . , matcell(J)  // chefes ocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == 2  & descartado == . , matcell(K)  // chefes desocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == .  & descartado == . , matcell(L)  // chefes inativos
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == 1  & descartado == . , matcell(M)  // cônjuges ocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == 2  & descartado == . , matcell(N)  // cônjuges desocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == .  & descartado == . , matcell(O)  // cônjuges inativos
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == 1  & descartado == . , matcell(P)  // filhos ocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == 2  & descartado == . , matcell(Q)  // filhos desocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 3 & VD4002 == .  & descartado == . , matcell(R)  // filhos inativos

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Fluxos de 2015-2 para 2015-3.xlsx" , modify sheet(Chefe)
putexcel B3 = matrix(A)
putexcel B4 = matrix(B)
putexcel B5 = matrix(C)
putexcel C3 = matrix(J)
putexcel C4 = matrix(K)
putexcel C5 = matrix(L)

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Fluxos de 2015-2 para 2015-3.xlsx" , modify sheet(Cônjuge)
putexcel B3 = matrix(D)
putexcel B4 = matrix(E)
putexcel B5 = matrix(F)
putexcel C3 = matrix(M)
putexcel C4 = matrix(N)
putexcel C5 = matrix(O)

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Fluxos de 2015-2 para 2015-3.xlsx" , modify sheet(Filhos)
putexcel B3 = matrix(G)
putexcel B4 = matrix(H)
putexcel B5 = matrix(I)
putexcel C3 = matrix(P)
putexcel C4 = matrix(Q)
putexcel C5 = matrix(R)

tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & od != . & descartado == . , matcell(a) // chefes que ficaram desocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & oi != . & descartado == . , matcell(b) // chefes que ficaram inativos
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & oo != . & descartado == . , matcell(c) // chefes que ficaram ocupados

tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & do != . & descartado == . , matcell(d) // chefes que ficaram ocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & dd != . & descartado == . , matcell(e) // chefes que ficaram desocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & di != . & descartado == . , matcell(f) // chefes que ficaram inativos

tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & io != . & descartado == . , matcell(g) // chefes que ficaram ocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & id != . & descartado == . , matcell(h) // chefes que ficaram desocupados
tab morador [iw=V1028] if chf == 1 & temcnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & ii != . & descartado == . , matcell(i) // chefes que ficaram inativos

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Fluxos de 2015-2 para 2015-3.xlsx" , modify sheet(Chefe)
putexcel B9 = matrix(a)
putexcel B10 = matrix(b)
putexcel B11 = matrix(c)
putexcel B12 = matrix(d)
putexcel B13 = matrix(e)
putexcel B14 = matrix(f)
putexcel B15 = matrix(g)
putexcel B16 = matrix(h)
putexcel B17 = matrix(i)


tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & od != . & descartado == . , matcell(a) // cônjuges que ficaram desocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & oi != . & descartado == . , matcell(b) // cônjuges que ficaram inativos
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & oo != . & descartado == . , matcell(c) // cônjuges que ficaram ocupados

tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & do != . & descartado == . , matcell(d) // cônjuges que ficaram ocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & dd != . & descartado == . , matcell(e) // cônjuges que ficaram desocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & di != . & descartado == . , matcell(f) // cônjuges que ficaram inativos

tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & io != . & descartado == . , matcell(g) // cônjuges que ficaram ocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & id != . & descartado == . , matcell(h) // cônjuges que ficaram desocupados
tab morador [iw=V1028] if cnj == 1 & temflh == 1 & Ano == 2015 & Trimestre == 2 & ii != . & descartado == . , matcell(i) // cônjuges que ficaram inativos

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Fluxos de 2015-2 para 2015-3.xlsx" , modify sheet(Cônjuge)
putexcel B9 = matrix(a)
putexcel B10 = matrix(b)
putexcel B11 = matrix(c)
putexcel B12 = matrix(d)
putexcel B13 = matrix(e)
putexcel B14 = matrix(f)
putexcel B15 = matrix(g)
putexcel B16 = matrix(h)
putexcel B17 = matrix(i)


tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & od != . & descartado == . , matcell(a) // filhos que ficaram desocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & oi != . & descartado == . , matcell(b) // filhos que ficaram inativos
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & oo != . & descartado == . , matcell(c) // filhos que ficaram ocupados

tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & do != . & descartado == . , matcell(d) // filhos que ficaram ocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & dd != . & descartado == . , matcell(e) // filhos que ficaram desocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & di != . & descartado == . , matcell(f) // filhos que ficaram inativos

tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & io != . & descartado == . , matcell(g) // filhos que ficaram ocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & id != . & descartado == . , matcell(h) // filhos que ficaram desocupados
tab morador [iw=V1028] if filho == 1 & temcnj == 1 & Ano == 2015 & Trimestre == 2 & ii != . & descartado == . , matcell(i) // filhos que ficaram inativos

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Fluxos de 2015-2 para 2015-3.xlsx" , modify sheet(Filhos)
putexcel B9 = matrix(a)
putexcel B10 = matrix(b)
putexcel B11 = matrix(c)
putexcel B12 = matrix(d)
putexcel B13 = matrix(e)
putexcel B14 = matrix(f)
putexcel B15 = matrix(g)
putexcel B16 = matrix(h)
putexcel B17 = matrix(i)
