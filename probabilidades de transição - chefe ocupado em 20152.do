* CÔNJUGE *
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnj152 == 1 & temflh == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix A`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & echf == 1 & cnj152 == 1 & temflh == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix B`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix C`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnj152 == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & echf == 1 & cnj152 == 1 & temflh == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix D`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnj152 == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & echf == 1 & cnj152 == 1 & temflh == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix E`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnj152 == 1 & temflh == 1   // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix F`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnj152 == 1 & temflh == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & echf == 1 & cnj152 == 1 & temflh == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix G`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix H`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & echf == 1 & cnj152 == 1 & temflh == 1 // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix I`per' = (b[1,1]/a[1,1])
}

matrix A = (A13,A14,A15,A16)
matrix B = (B13,B14,B15,B16)
matrix C = (C13,C14,C15,C16)
matrix D = (D13,D14,D15,D16)
matrix E = (E13,E14,E15,E16)
matrix F = (F13,F14,F15,F16)
matrix G = (G13,G14,G15,G16)
matrix H = (H13,H14,H15,H16)
matrix I = (I13,I14,I15,I16)

matrix A = (A\B\C)
matrix B = (D\E\F)
matrix C = (G\H\I)

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Comparação Chefe Empregado ou Desempregado em 20152.xlsx" , modify sheet(Tabelas)
putexcel B3 = matrix(A)
putexcel K3 = matrix(B)
putexcel U3 = matrix(C)



*************************************************************************** FILHO **************************************************************************************************************************************************

foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flh152 == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & echf == 1 & flh152 == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix A`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flh152 == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & echf == 1 & flh152 == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix B`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flh152 == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & echf == 1 & flh152 == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix C`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flh152 == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & echf == 1 & flh152 == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix D`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flh152 == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & echf == 1 & flh152 == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix E`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flh152 == 1   // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & echf == 1 & flh152 == 1  // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix F`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flh152 == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & echf == 1 & flh152 == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix G`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flh152 == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & echf == 1 & flh152 == 1  // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix H`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 13 14 15 16 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flh152 == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & echf == 1 & flh152 == 1  // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix I`per' = (b[1,1]/a[1,1])
}

matrix A = (A13,A14,A15,A16)
matrix B = (B13,B14,B15,B16)
matrix C = (C13,C14,C15,C16)
matrix D = (D13,D14,D15,D16)
matrix E = (E13,E14,E15,E16)
matrix F = (F13,F14,F15,F16)
matrix G = (G13,G14,G15,G16)
matrix H = (H13,H14,H15,H16)
matrix I = (I13,I14,I15,I16)

matrix A = (A\B\C)
matrix B = (D\E\F)
matrix C = (G\H\I)

putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Comparação Chefe Empregado ou Desempregado em 20152.xlsx" , modify sheet(Tabelas)
putexcel B15 = matrix(A)
putexcel K15 = matrix(B)
putexcel U15 = matrix(C)
