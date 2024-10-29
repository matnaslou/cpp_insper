* CÔNJUGE *
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix A`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix B`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix C`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix D`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix E`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix F`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix G`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix H`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix I`per' = (b[1,1]/a[1,1])
}

matrix A = (A10,A11,A12,A13,A14,A15)
matrix B = (B10,B11,B12,B13,B14,B15)
matrix C = (C10,C11,C12,C13,C14,C15)
matrix D = (D10,D11,D12,D13,D14,D15)
matrix E = (E10,E11,E12,E13,E14,E15)
matrix F = (F10,F11,F12,F13,F14,F15)
matrix G = (G10,G11,G12,G13,G14,G15)
matrix H = (H10,H11,H12,H13,H14,H15)
matrix I = (I10,I11,I12,I13,I14,I15)



*************************************************************************** FILHO **************************************************************************************************************************************************

foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flhvalido == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & echf == 1 & flhvalido == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix J`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flhvalido == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & echf == 1 & flhvalido == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix K`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flhvalido == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & echf == 1 & flhvalido == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix L`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flhvalido == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & echf == 1 & flhvalido == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix M`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flhvalido == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & echf == 1 & flhvalido == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix N`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flhvalido == 1   // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & echf == 1 & flhvalido == 1  // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix O`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flhvalido == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & echf == 1 & flhvalido == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix P`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flhvalido == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & echf == 1 & flhvalido == 1  // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix Q`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flhvalido == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & echf == 1 & flhvalido == 1  // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix R`per' = (b[1,1]/a[1,1])
}

matrix J = (J10,J11,J12,J13,J14,J15)
matrix K = (K10,K11,K12,K13,K14,K15)
matrix L = (L10,L11,L12,L13,L14,L15)
matrix M = (M10,M11,M12,M13,M14,M15)
matrix N = (N10,N11,N12,N13,N14,N15)
matrix O = (O10,O11,O12,O13,O14,O15)
matrix P = (P10,P11,P12,P13,P14,P15)
matrix Q = (Q10,Q11,Q12,Q13,Q14,Q15)
matrix R = (R10,R11,R12,R13,R14,R15)


putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Comparação Chefe Empregado ou Desempregado 3ª Entrevista em 20153.xlsx" , modify sheet(Tabelas)
putexcel B3 = matrix(A)
putexcel B7 = matrix(B)
putexcel B12 = matrix(C)
putexcel K3 = matrix(D)
putexcel K7 = matrix(E)
putexcel K12 = matrix(F)
putexcel U3 = matrix(G)
putexcel U7 = matrix(H)
putexcel U12 = matrix(I)
putexcel B17 = matrix(J)
putexcel B21 = matrix(K)
putexcel B25 = matrix(L)
putexcel K17 = matrix(M)
putexcel K21 = matrix(N)
putexcel K25 = matrix(O)
putexcel U17 = matrix(P)
putexcel U21 = matrix(Q)
putexcel U25 = matrix(R)

clear matrix

******************************************************************* CÔNJUGE ***************************************************************************************************************************************************************************************************************
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix A`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix B`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix C`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix D`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix E`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix F`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix G`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix H`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix I`per' = (b[1,1]/a[1,1])
}

matrix A = (A10,A11,A12,A13,A14,A15)
matrix B = (B10,B11,B12,B13,B14,B15)
matrix C = (C10,C11,C12,C13,C14,C15)
matrix D = (D10,D11,D12,D13,D14,D15)
matrix E = (E10,E11,E12,E13,E14,E15)
matrix F = (F10,F11,F12,F13,F14,F15)
matrix G = (G10,G11,G12,G13,G14,G15)
matrix H = (H10,H11,H12,H13,H14,H15)
matrix I = (I10,I11,I12,I13,I14,I15)



*************************************************************************** FILHO **************************************************************************************************************************************************

foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix J`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix K`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix L`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix M`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix N`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix O`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & dchf == 1 & flhvalido == 1  & temcnj == 1 // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix P`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix Q`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 10 11 12 13 14 15 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix R`per' = (b[1,1]/a[1,1])
}

matrix J = (J10,J11,J12,J13,J14,J15)
matrix K = (K10,K11,K12,K13,K14,K15)
matrix L = (L10,L11,L12,L13,L14,L15)
matrix M = (M10,M11,M12,M13,M14,M15)
matrix N = (N10,N11,N12,N13,N14,N15)
matrix O = (O10,O11,O12,O13,O14,O15)
matrix P = (P10,P11,P12,P13,P14,P15)
matrix Q = (Q10,Q11,Q12,Q13,Q14,Q15)
matrix R = (R10,R11,R12,R13,R14,R15)


putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Comparação Chefe Empregado ou Desempregado 3ª Entrevista em 20153.xlsx" , modify sheet(Tabelas)
putexcel B4 = matrix(A)
putexcel B8 = matrix(B)
putexcel B13 = matrix(C)
putexcel K4 = matrix(D)
putexcel K8 = matrix(E)
putexcel K13 = matrix(F)
putexcel U4 = matrix(G)
putexcel U8 = matrix(H)
putexcel U13 = matrix(I)
putexcel B18 = matrix(J)
putexcel B22 = matrix(K)
putexcel B26 = matrix(L)
putexcel K18 = matrix(M)
putexcel K22 = matrix(N)
putexcel K26 = matrix(O)
putexcel U18 = matrix(P)
putexcel U22 = matrix(Q)
putexcel U26 = matrix(R)
