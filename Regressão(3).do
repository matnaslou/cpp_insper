foreach ano in 2012 2013 2014 2015 {
local ano = 2013
use "P:\Arquivos IFB\Pnads\pnad`ano'\dados\PNAD`ano'", clear
if `ano' != 2014 & `ano' != 2015 {
drop _merge
}

rename V0101 Ano 

merge m:m Ano using "P:\Matheus\Dados\Deflatores - PNAD Anual" 
drop if _merge == 2


if (`ano' >= 2012 & `ano' <= 2015) {
rename V4724 V4725
}

* Compatibilização *
replace V4745 = . if V4745 == 8
replace V4719 = . if V4719 >= 999999999999
replace V4719 = . if V4719 == -1
replace V4719 = . if V8005 < 14
replace V4805 = . if V8005 < 14
replace V4805 = . if V9058 <= 1 & (V9115 == 3 | V9116 == 4 | V9117 == 3 | V9118 == 2 | V9118 == 4)
replace V4805 = 2 if V9058 <= 1 & (V9115 == 1 | V9116 == 2 | V9117 == 1) & V8005 > 14
replace V4805 = . if (V4715 == 12 | V4715 == 13) 
replace V4805 = 2 if (V4715 == 12 | V4715 == 13) & (V9115 == 1 | V9116 == 2 | V9117 == 1) & V8005 > 14
replace V4805 = . if V9004 == 2
replace V4741 = . if V4741 == 1 & V0401 != 1
replace V4721 = . if V8005 < 14 
replace V4721 = . if V4721 >= 999999999999
replace V4805 = 1 if V8005 < 14

* Gerando Variáveis *
 * 0) Número de moradores *
       gen morador = 1 if V0401 <= 3 & V8005 >= 14 & (V4805 == 1 | V4805 == 2)
	   replace morador = 0 if V0401 > 3
	   bysort UF V0102 V0103: egen tot_moradores = total(morador)
	   replace tot_moradores = . if tot_moradores == 0
  * 20) Total de Moradores (contando com Outros e Agregados)
      replace morador = 1 if V0401 <= 5 & V8005 >= 14 & (V4805 == 1 | V4805 == 2)
	  bysort UF V0102 V0103: egen tot_moradores2 = total(morador)
	  replace tot_moradores2 = . if tot_moradores2 == 0	 
 * 1) Cônjuge Desempregado
       gen conj_dsmprgd = 1 if (V0401 == 2) & V4805 == 2 
       replace conj_dsmprgd = 0 if (V0401 == 2) & (V4805 == 1 | V4805 == . )
	   bysort UF V0102 V0103: egen cnj_dsmprgd = total(conj_dsmprgd) 
	   drop conj_dsmprgd
	   

 * 2) Tem Filho?, Número de Filhos e Dummy de Filhos
       gen flh = 1 if V0401 == 3 // Dummy
	   replace flh = 0 if V0401 != 3
	   bysort UF V0102 V0103: egen n_flh = total(flh) // Núm. de Filhos
	   bysort UF V0102 V0103: egen tem_flh = total(flh) // Tem Filho?
	   replace tem_flh = 1 if tem_flh >= 1
	   
 * 4) Chefe Desempregado
       gen chefe_dsmprgd = 1 if V0401 == 1 & V4805 == 2 
	   replace chefe_dsmprgd = 0 if V0401 == 1 & (V4805 == 1 | V4805 == . )
	   bysort UF V0102 V0103: egen chf_dsmprgd = total(chefe_dsmprgd)
/*	   
 * 5) Outro Desempregado (Parente ou Agregado)
       gen outro_dsmprgd = 2 if V0401 == 4 & (V4805 == 2 | V4805 == .)
	   replace outro_dsmprgd = 1 if V0401 == 4 & V4805 == 1
	   bysort UF V0102 V0103: egen otr_dsmprgd = total(outro_dsmprgd) 
 */
 * 6) Tem Cônjuge?
       gen cnj = 1 if V0401 == 2
	   replace cnj = 0 if V0401 != 2
	   bysort UF V0102 V0103: egen n_cnj = total(cnj)
	   bysort UF V0102 V0103: egen tem_cnj = total(cnj)
	   replace tem_cnj = 1 if tem_cnj >= 1
	   
 * 7) Tem Outro Parente?
       gen outro = 1 if V0401 == 4 
	   replace outro = 0 if V0401 != 4 
	   bysort UF V0102 V0103: egen n_outro = total(outro)
	   bysort UF V0102 V0103: egen tem_outro = total(outro)
	   replace tem_outro = 1 if tem_outro >= 1
	   
	   
 * 9) Dummies de Chefe, Cõnjuge, Filho e Outros
       gen chf = 1 if V0401 == 1
	   replace chf = 0 if V0401 != 1
	   
 * 10) Renda Total do Trabalho no Domicílio 
       replace V4719 = V4719/Deflator
	   replace V4719 = . if V0401 >= 4
	   bysort UF V0102 V0103: egen renda_trabalho = total(V4719)
	   bysort UF V0102 V0103: gen renda_trabalho_pc = renda_trabalho/tot_moradores2
	   

 * 11) Renda Domiciliar Per Capita
       replace V4720 = . if V0401 > 5 | V8005 < 14 | (V0401 <= 5 & V4805 == .)
	   replace V4720 = . if V4720 >= 999999999999
       replace V4720 = V4720/Deflator
	   bysort UF V0102 V0103: egen renda = total(V4720)
	   bysort UF V0102 V0103: gen renda_pc = renda/tot_moradores2	 
	   
 * 12) Alguém Sem Emprego
       bysort UF V0102 V0103: gen sem_emprego = 1 if V4805 == 2 
	   bysort UF V0102 V0103: replace sem_emprego = 0 if (V4805 == 1 | V4805 == . )
	   bysort UF V0102 V0103: egen qtda_sem_emprego = total(sem_emprego)
	   
 * 14) Domicílio com/sem Filho maior de 18 anos
       gen mais_velho = 1 if V0401 == 3 & V8005 >= 14
	   replace mais_velho = 0 if V0401 == 3 & V8005 < 14
	   bysort UF V0102 V0103: egen tem_mais_velho = total(mais_velho)
	   bysort UF V0102 V0103: egen q_mais_velho = total(mais_velho)
	   replace tem_mais_velho = 1 if tem_mais_velho != 0 & tem_mais_velho != .
	   
 * 15) Filho mais velho Desempregado
       gen m_vlh_dsmprgd = 1 if V0401 == 3 & V4805 == 2  & V8005 >= 14
	   replace m_vlh_dsmprgd = 0 if V0401 == 3 & (V4805 == 1 | V4805 == . ) & V8005 >= 14
	   bysort UF V0102 V0103: egen filhos_dsmprgd = total(m_vlh_dsmprgd)
	   replace filhos_dsmprgd = 1 if filhos_dsmprgd >= 1
	   *replace filhos_dsmprgd = . if n_flh == 0
	   
	   
 * 16) Morador (medida de contagem)	   
       *gen morador = 1	   
 * 17) Idade do Chefe: 
      gen id_chf = V8005 if V0401 == 1
	  bysort UF V0102 V0103: egen idade_chf = total(id_chf)
	  replace idade_chf = . if idade_chf == 0
 * 18) Sexo do Chefe:
      gen sx_chf = 1 if V0302 == 2 & V0401 == 1
	  replace sx_chf = 2 if V0302 == 4 & V0401 == 1
      bysort UF V0102 V0103: egen sexo_chf = total(sx_chf)
	  replace sexo_chf = . if sexo_chf == 0
	  

	  
 * 21) Dummy de UF:
      gen uf = 1 if UF == 11
	  replace uf = 2 if UF == 12
	  replace uf = 3 if UF == 13
	  replace uf = 4 if UF == 14
	  replace uf = 5 if UF == 15
      replace uf = 6 if UF == 16
	  replace uf = 7 if UF == 17
	  replace uf = 8 if UF == 21
	  replace uf = 9 if UF == 22
	  replace uf = 10 if UF == 23
	  replace uf = 11 if UF == 24
	  replace uf = 12 if UF == 25
	  replace uf = 13 if UF == 26
	  replace uf = 14 if UF == 27
	  replace uf = 15 if UF == 28
	  replace uf = 16 if UF == 29
	  replace uf = 17 if UF == 31
	  replace uf = 18 if UF == 32
	  replace uf = 19 if UF == 33
	  replace uf = 20 if UF == 35
	  replace uf = 21 if UF == 41
	  replace uf = 22 if UF == 42
	  replace uf = 23 if UF == 43
	  replace uf = 24 if UF == 50
	  replace uf = 25 if UF == 51
	  replace uf = 26 if UF == 52
	  replace uf = 27 if UF == 53
	  
 * 22) Dummy de Raça	  
      gen raca = 1 if V0404 == 2
	  replace raca = 2 if V0404 == 4
	  replace raca = 3 if V0404 == 6
	  replace raca = 4 if V0404 == 8
	  replace raca = 5 if V0404 == 0
	  
 * 23) Dummy Filhos Mais Novos	  
      gen flh_m_novo = 1 if V0401 == 3 & V8005 < 14
	  replace flh_m_novo = 0 if V0401 != 3 | (V0401 == 3 & V8005 >= 14)
      bysort UF V0102 V0103: egen q_mais_novo = total(flh_m_novo)
	  bysort UF V0102 V0103: egen tem_mais_novo = total(flh_m_novo)
	  replace tem_mais_novo = 1 if tem_mais_novo != 0 & tem_mais_novo != .
	  
 * 24) Dummy de Educação 
      replace g_educa_cpp = 4 if g_educa_cpp == 5
      * 19) Escolaridade do Chefe:
      gen educ_chf = g_educa_cpp if V0401 == 1
	  bysort UF V0102 V0103: egen educacao_chf = total(educ_chf) 
	  replace educacao_chf = . if educacao_chf == 0	 
 
 ************************
* Regressões com a Renda * i.uf
 ************************
bysort uf : regress renda_pc chf_dsmprgd tem_cnj cnj_dsmprgd tem_mais_novo tem_mais_velho filhos_dsmprgd tot_moradores2 i.raca idade_chf sexo_chf i.educacao_chf   [aw=V4729] if V0401==1 , vce(robust)
outreg2 using "P:\Matheus\teste1`ano'" , replace word
/*foreach n in 11 12 13 14 15 16 17 21 22 23 24 25 26 27 28 29 31 32 33 35 41 42 43 50 51 52 53  {
regress renda_pc chf cnj flh_m_novo flh_m_vlh chf_dsmprgd cnj_dsmprgd filhos_dsmprgd tot_moradores2 i.g_educa_cpp i.raca idade_chf sexo_chf i.educacao_chf i.uf [aw=V4729] if UF == `n' , vce(robust)
outreg2 using "P:\Matheus\teste1`ano'" , append word
}	  
*/
regress renda_trabalho_pc chf_dsmprgd tem_cnj cnj_dsmprgd tem_mais_novo tem_mais_velho filhos_dsmprgd tot_moradores2 i.raca idade_chf sexo_chf i.educacao_chf i.uf [aw=V4729] if V0401 == 1 , vce(robust)
outreg2 using "P:\Matheus\teste2`ano'" , replace word
 *********
* Margins * 
 *********

 margins [aw=V4729] , at(chf_dsmprgd = (0 1) cnj_dsmprgd = (0 1))            // Chefe e Cônjuge
 marginsplot , xdim(chf_dsmprgd cnj_dsmprgd) plotopts(barw(.8)) recast(bar)
 
 margins [aw=V4729] , at(chf_dsmprgd = (0 1) filhos_dsmprgd = (0 1))          // Chefe e Filho
 marginsplot , xdim(chf_dsmprgd filhos_dsmprgd) plotopts(barw(.8)) recast(bar)
 
 margins [aw=V4729] , at(chf_dsmprgd = (0 1) cnj_dsmprgd = (0 1) filhos_dsmprgd = (0 1))   // Chefe, Cônjuge e Filho
 marginsplot , xdim(chf_dsmprgd cnj_dsmprgd filhos_dsmprgd) plotopts(barw(.8)) recast(bar)
 
 margins [aw=V4729] , at(tem_cnj = (0 1) tem_mais_velho = (0 1) tem_mais_novo = (0 1))  // Chefe, Cônjuge e Filhos - Composição
 marginsplot , xdim(tem_mais_novo tem_mais_velho tem_cnj) plotopts(barw(.8)) recast(bar)
 
 margins [aw=V4729] , at(chf_dsmprgd = (0 1) sexo_chf = (1 2))             // Chefe - Ocupação e Sexo
 marginsplot , xdim(chf_dsmprgd sexo_chf) plotopts(barw(.8)) recast(bar)
 
 margins [aw=V4729] , at(chf_dsmprgd = (0 1) sexo_chf = (1 2) educacao_chf = (1 2 3 4)) // Chefe - Ocupação, Sexo e Educação
 marginsplot , xdim(chf_dsmprgd educacao_chf sexo_chf) plotopts(barw(.8)) recast(bar)

 margins [aw=V4729] , at(tem_cnj = (1) tem_mais_novo = (1) tem_mais_velho = (1) chf_dsmprgd = (0) cnj_dsmprgd =(0) filhos_dsmprgd =(0) uf =(1/27))
 marginsplot ,  plotopts(barw(.8)) recast(bar)
 bysort UF: tabstat renda_pc [aw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_velho == 1 & tem_mais_novo == 1 & chf_dsmprgd == 0 & cnj_dsmprgd == 0 & filhos_dsmprgd == 0 
 
 gen pea = 1 if V4805 == 1 | V4805 == 2

 * Nº Domicílios (Total) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 
 * Nº Domicílios (Só Chefe Desempregado) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 1 & cnj_dsmprgd == 0 & filhos_dsmprgd == 0 
 * Nº Domicílios (Só Cônjuge Desempregado) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 0 & cnj_dsmprgd == 1 & filhos_dsmprgd == 0 
 * Nº Domicílios (Só Filho Desempregado) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 0 & cnj_dsmprgd == 0 & filhos_dsmprgd == 1 
 * Nº Domicílios (Chefe e Cônjuge Desempregado) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 1 & cnj_dsmprgd == 1 & filhos_dsmprgd == 0 
 * Nº Domicílios (Chefe e Filho Desempregado) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 1 & cnj_dsmprgd == 0 & filhos_dsmprgd == 1 
 * Nº Domicílios (Cônjuge e Filho Desempregado) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 0 & cnj_dsmprgd == 1 & filhos_dsmprgd == 1 
 * Nº Domicílios (Todos Desempregados) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 1 & cnj_dsmprgd == 1 & filhos_dsmprgd == 1 
 * Nº Domicílios (Todos Empregados) *
bysort uf: tab pea [iw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_novo == 1 & tem_mais_velho == 1 & chf_dsmprgd == 0 & cnj_dsmprgd == 0 & filhos_dsmprgd == 0 

bysort uf: tabstat renda_pc [aw=V4729] if V0401 == 1 & tem_cnj == 1 & tem_mais_velho == 1 & tem_mais_novo == 1 

 putexcel set "P:\Matheus\Resultados\Regressões\Regressão.xlsx" , modify sheet(Modelo 2012-2015)
 putexcel B10 = matrix(A)
 putexcel C10 = matrix(B)
 putexcel D10 = matrix(C)
 putexcel E10 = matrix(D)
 putexcel F10 = matrix(E)
}
*********************************
* Regressão PNAD Contínua Anual *
*********************************   

foreach ano in 2016 2017 {


use "P:\Arquivos IFB\Pnad Contínua\Anual\\`ano'\Dados\PNADC_`ano'_entr1" , clear

merge m:1 Ano UF Trimestre using "P:\Arquivos IFB\Pnad Contínua\Documentação\Deflatores\Deflatores_201801\deflator" 
drop if _merge == 2
* Gerando Variáveis *
 replace V2005 = 6 if V2005 > 6 & V2005 <= 16
 replace VD4002 = 1 if V2009 < 18 & V2005 != 2 & V2005 != 3
 
 * 0) Número de moradores *
       gen morador = 1 if V2005 <= 5
	   replace morador = 0 if V2005 > 5
	   bysort UF UPA V1008 V1014: egen tot_moradores = total(morador)
	   replace tot_moradores = . if tot_moradores == 0
* 20) Total de Moradores (contando com Outros e Agregados)
      replace morador = 1 if V2005 <= 6
	  bysort UF UPA V1008 V1014: egen tot_moradores2 = total(morador)
	  replace tot_moradores2 = . if tot_moradores2 == 0	 
 * 1) Cônjuge Desempregado
       gen conj_dsmprgd = 1 if (V2005 == 2 | V2005 == 3) & (VD4002 == 2 | VD4002 == .)
       replace conj_dsmprgd = 0 if (V2005 == 2 | V2005 == 3) & VD4002 == 1
	   *replace conj_dsmprgd = 0 if V0401 != 2
	   bysort UF UPA V1008 V1014: egen cnj_dsmprgd = total(conj_dsmprgd) 
	   drop conj_dsmprgd
	   *replace cnj_dsmprgd = . if chefe == 0

 * 2) Tem Filho?
       gen flh = 1 if V2005 == 4 | V2005 == 5
	   replace flh = 0 if V2005 != 4 & V2005 != 5
	   bysort UF UPA V1008 V1014: egen n_flh = total(flh)
	   bysort UF UPA V1008 V1014: egen tem_flh = total(flh)
	   replace tem_flh = 1 if tem_flh >= 1
	   
 * 4) Chefe Desempregado
       gen chefe_dsmprgd = 1 if V2005 == 1 & (VD4002 == 2 | VD4002 == .) 
	   replace chefe_dsmprgd = 0 if V2005 == 1 & VD4002 == 1 
	   bysort UF UPA V1008 V1014: egen chf_dsmprgd = total(chefe_dsmprgd)
	   *drop chefe_dsmprgd	
 * 6) Tem Cônjuge?
       gen cnj = 1 if V2005 == 2 | V2005 == 3
	   replace cnj = 0 if V2005 != 2 & V2005 != 3
	   bysort UF UPA V1008 V1014: egen n_cnj = total(cnj)
	   bysort UF UPA V1008 V1014: egen tem_cnj = total(cnj)
	   replace tem_cnj = 1 if tem_cnj >= 1
	   
 * 7) Tem Outro Parente?
       gen outro = 1 if V2005 == 6 
	   replace outro = 0 if V2005 != 6
	   bysort UF UPA V1008 V1014: egen n_outro = total(outro)
	   bysort UF UPA V1008 V1014: egen tem_outro = total(outro)
	   replace tem_outro = 1 if tem_outro >= 1
	   
 * 9) Chefe
       gen chefe = 1 if V2005 == 1
	   replace chefe = 0 if V2005 != 1
	   
 * 10) Renda Total do Trabalho no Domicílio 
       replace VD4020 = VD4020 * Efetivo
	   replace VD4020 = . if V2005 >= 6
	   bysort UF UPA V1008 V1014: egen renda_trabalho = total(VD4020)
	   bysort UF UPA V1008 V1014: gen renda_trabalho_pc = renda_trabalho/tot_moradores2
	   
 * 11) Renda Domiciliar Per Capita (DIFERENTE PARA REGRESSÃO DO Q PARA O RESTO)
       replace VD4020 = 0 if VD4020 == . 
	   replace VD4048 = 0 if VD4048 == .
	   replace VD4020 = VD4020 * Efetivo
	   replace VD4048 = VD4048 * Efetivo
	   replace VD4020 = . if V2005 > 5
	   replace VD4048 = . if V2005 > 5
	   gen renda = VD4020 + VD4048 if V2005 <= 5
	   bysort UF UPA V1008 V1014: egen renda_total = total(renda)
	   *replace renda_total = . if V2005 > 5
	   gen renda_pc = renda_total/tot_moradores2
	   
  * 14) Domicílio com/sem Filho maior de 18 anos
       gen mais_velho = 1 if (V2005 == 4 | V2005 == 5) & V2009 >= 18
	   replace mais_velho = 0 if (V2005 == 4 | V2005 == 5) & V2009 < 18
	   bysort UF UPA V1008 V1014: egen tem_mais_velho = total(mais_velho)
	   bysort UF UPA V1008 V1014: egen q_mais_velho = total(mais_velho)
	   replace tem_mais_velho = 1 if tem_mais_velho != 0 & tem_mais_velho != .
 
 * 15) Filho mais velho Desempregado
       gen m_vlh_dsmprgd = 1 if (V2005 == 4 | V2005 == 5) & VD4002 == 2 & V2009 >= 14
	   replace m_vlh_dsmprgd = 0 if (V2005 == 4 | V2005 == 5) & VD4002 != 2 & V2009 >= 14
	   bysort UF UPA V1008 V1014: egen filhos_dsmprgd = total(m_vlh_dsmprgd)
	   replace filhos_dsmprgd = . if n_flh == 0
	   replace V2005 = 4 if V2005 == 5
	   gen flh_m_vlh = 1 if V2005 == 4 & V2009 >= 14
	   replace flh_m_vlh = 0 if V2005 != 4 | (V2005 == 4 & V2009 < 14)	  
 * 17) Idade do Chefe: 
      gen id_chf = V2009 if V2005 == 1
	  bysort UF UPA V1008 V1014: egen idade_chf = total(id_chf)
	  replace idade_chf = . if idade_chf == 0
 * 18) Sexo do Chefe:
      gen sx_chf = 1 if V2007 == 1 & V2005 == 1
	  replace sx_chf = 2 if V2007 == 2 & V2005 == 1
      bysort UF UPA V1008 V1014: egen sexo_chf = total(sx_chf)
	  replace sexo_chf = . if sexo_chf == 0
 * 19) Escolaridade do Chefe:
      gen educ_chf = 1 if V2005 == 1 & VD3001 == 1
	  replace educ_chf = 2 if V2005 == 1 & (VD3001 == 2 | VD3001 == 3)
	  replace educ_chf = 3 if V2005 == 1 & (VD3001 == 4 | VD3001 == 5)
	  replace educ_chf = 4 if V2005 == 1 & (VD3001 == 6 | VD3001 == 7)
	  bysort UF UPA V1008 V1014: egen educacao_chf = total(educ_chf) 
	  replace educacao_chf = . if educacao_chf == 0		   
 * 23) Dummy Filhos Mais Novos	  
      gen flh_m_novo = 1 if V2005 == 4  & V2009 < 14
	  replace flh_m_novo = 0 if V2005 != 4 | (V2005 == 4 & V2009 >= 14)
	  bysort UF UPA V1008 V1014: egen q_mais_novo = total(flh_m_novo)
	  bysort UF UPA V1008 V1014: egen tem_mais_novo = total(flh_m_novo)
	  replace tem_mais_novo = 1 if tem_mais_novo != 0 & tem_mais_novo != .
	  
 * 22) Dummy de Raça	  
      gen raca = 1 if V2010 == 1
	  replace raca = 2 if V2010 == 2
	  replace raca = 3 if V2010 == 3
	  replace raca = 4 if V2010 == 4
	  replace raca = 5 if V2010 == 5
	  replace raca = . if V2010 == 9
 * 21) Dummy de UF:
      gen uf = 1 if UF == 11
	  replace uf = 2 if UF == 12
	  replace uf = 3 if UF == 13
	  replace uf = 4 if UF == 14
	  replace uf = 5 if UF == 15
      replace uf = 6 if UF == 16
	  replace uf = 7 if UF == 17
	  replace uf = 8 if UF == 21
	  replace uf = 9 if UF == 22
	  replace uf = 10 if UF == 23
	  replace uf = 11 if UF == 24
	  replace uf = 12 if UF == 25
	  replace uf = 13 if UF == 26
	  replace uf = 14 if UF == 27
	  replace uf = 15 if UF == 28
	  replace uf = 16 if UF == 29
	  replace uf = 17 if UF == 31
	  replace uf = 18 if UF == 32
	  replace uf = 19 if UF == 33
	  replace uf = 20 if UF == 35
	  replace uf = 21 if UF == 41
	  replace uf = 22 if UF == 42
	  replace uf = 23 if UF == 43
	  replace uf = 24 if UF == 50
	  replace uf = 25 if UF == 51
	  replace uf = 26 if UF == 52
	  replace uf = 27 if UF == 53
 ************************
* Regressões com a Renda *
 ************************

regress renda_pc chf_dsmprgd tem_cnj cnj_dsmprgd tem_mais_novo tem_mais_velho filhos_dsmprgd tot_moradores2 i.raca idade_chf sexo_chf i.educacao_chf i.uf [aw=V1032] if V2005 == 1 , vce(robust)
outreg2 using "P:\Matheus\teste1`ano'" , replace word
/*foreach n in 11 12 13 14 15 16 17 21 22 23 24 25 26 27 28 29 31 32 33 35 41 42 43 50 51 52 53  {
regress renda_pc chefe cnj flh chf_dsmprgd cnj_dsmprgd filhos_dsmprgd idade_chf sexo_chf educacao_chf [aw=V1032] if UF == `n' , vce(robust)
outreg2 using "P:\Matheus\teste" , append word
}
*/
regress renda_trabalho_pc chf_dsmprgd tem_cnj cnj_dsmprgd tem_mais_novo tem_mais_velho filhos_dsmprgd tot_moradores2 i.raca idade_chf sexo_chf i.educacao_chf i.uf [aw=V1032] if V2005 == 1 , vce(robust)
outreg2 using "P:\Matheus\teste2`ano'" , replace word
}
	  
