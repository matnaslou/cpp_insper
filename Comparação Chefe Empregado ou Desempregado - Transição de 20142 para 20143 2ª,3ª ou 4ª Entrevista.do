foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix A`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix B`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix C`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix D`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix E`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix F`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & echf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix G`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix H`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & echf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix I`per' = (b[1,1]/a[1,1])
}




*************************************************************************** FILHO **************************************************************************************************************************************************

foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flhvalido == 1 & temcnj == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & echf == 1 & flhvalido == 1 & temcnj == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix J`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix K`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & echf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & echf == 1 & flhvalido == 1 & temcnj == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix L`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix M`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix N`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & echf == 1 & flhvalido == 1  & temcnj == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix O`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix P`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & echf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix Q`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & echf == 1 & flhvalido == 1  & temcnj == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & echf == 1 & flhvalido == 1  & temcnj == 1 // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix R`per' = (b[1,1]/a[1,1])
}


putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Comparação Chefe Empregado ou Desempregado - Transição de 20142 para 20143 2ª,3ª ou 4ª Entrevista.xlsx" , modify sheet(Tabelas)
putexcel B3 = matrix(A9)
putexcel B7 = matrix(B9)
putexcel B12 = matrix(C9)
putexcel K3 = matrix(D9)
putexcel K7 = matrix(E9)
putexcel K12 = matrix(F9)
putexcel U3 = matrix(G9)
putexcel U7 = matrix(H9)
putexcel U12 = matrix(I9)
putexcel B9 = matrix(J9)
putexcel B21 = matrix(K9)
putexcel B25 = matrix(L9)
putexcel K9 = matrix(M9)
putexcel K21 = matrix(N9)
putexcel K25 = matrix(O9)
putexcel U9 = matrix(P9)
putexcel U21 = matrix(Q9)
putexcel U25 = matrix(R9)

clear matrix

******************************************************************* CÔNJUGE ***************************************************************************************************************************************************************************************************************
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix A`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix B`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix C`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix D`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix E`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1   // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix F`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1  // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix G`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix H`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & dchf == 1 & cnjvalido == 1 & temflh == 1 // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix I`per' = (b[1,1]/a[1,1])
}




*************************************************************************** FILHO **************************************************************************************************************************************************

foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oo == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoa Ocupada Inicialmente E Agora
matrix b = r(N)
matrix J`per' = (b[1,1]/a[1,1])
}
*** Situação OD: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & od == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Ocupada Inicialmente E Agora está DESOCUPADA
matrix b = r(N)
matrix K`per' = (b[1,1]/a[1,1])
}
*** Situação OI: 
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (oo == `per' | od == `per' | oi == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Ocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & oi == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoa Ocupada Inicialmente E Agora está INATIVA
matrix b = r(N)
matrix L`per' = (b[1,1]/a[1,1])
}
** Desocupação Inicial:	
*** Situação DO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1 // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & do == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix M`per' = (b[1,1]/a[1,1])
}	
*** Situação DD:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & dd == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente E Agora Também 
matrix b = r(N)
matrix N`per' = (b[1,1]/a[1,1])
}	
*** Situação DI:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (do == `per' | dd == `per' | di == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Desocupadas na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & di == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Desocupada Inicialmente E Agora está INATIVA 
matrix b = r(N)
matrix O`per' = (b[1,1]/a[1,1])
}
** Inatividade Inicial:	
*** Situação IO:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & io == `per' & dchf == 1 & flhvalido == 1  & temcnj == 1 // Pessoa Inativa Inicialmente e Agora estão OCUPADAS
matrix b = r(N)
matrix P`per' = (b[1,1]/a[1,1])
}	
*** Situação ID:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & id == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Inativa Inicialmente E Agora está DESOCUPADA 
matrix b = r(N)
matrix Q`per' = (b[1,1]/a[1,1])
}	
*** Situação II:
foreach per in 9 {
tab morador [iw=V1028] if per == `per' & (io == `per' | id == `per' | ii == `per') & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoas Inativa na Situação Inicial
matrix a = r(N)
tab morador [iw=V1028] if per == `per' & ii == `per' & dchf == 1 & flhvalido == 1 & temcnj == 1  // Pessoa Inativa Inicialmente e no Período seguinte Também
matrix b = r(N)
matrix R`per' = (b[1,1]/a[1,1])
}



putexcel set "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\Comparação Chefe Empregado ou Desempregado - Transição de 20142 para 20143 2ª,3ª ou 4ª Entrevista.xlsx" , modify sheet(Tabelas)
putexcel B4 = matrix(A9)
putexcel B8 = matrix(B9)
putexcel B9 = matrix(C9)
putexcel K4 = matrix(D9)
putexcel K8 = matrix(E9)
putexcel K9 = matrix(F9)
putexcel U4 = matrix(G9)
putexcel U8 = matrix(H9)
putexcel U9 = matrix(I9)
putexcel B18 = matrix(J9)
putexcel B22 = matrix(K9)
putexcel B26 = matrix(L9)
putexcel K18 = matrix(M9)
putexcel K22 = matrix(N9)
putexcel K26 = matrix(O9)
putexcel U18 = matrix(P9)
putexcel U22 = matrix(Q9)
putexcel U26 = matrix(R9)
