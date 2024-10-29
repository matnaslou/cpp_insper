
           V2007 V2009 raca VD3005 rendadom dUF* dmano* if Trimestre == 2 & temcnj == 1 & temflh == 1

* médias dessas características em domicílios que o cnj/flh trabalhava no 2º trim e em domicílios em que estava inativo *
gen cnj_eraativo = 1 if ehcnj == 1 & VD4002 == 1 & Trimestre == 2
gen flh_eraativo = 1 if ehflh == 1 & VD4002 == 1 & Trimestre == 2
replace cnj_eraativo = 0 if ehcnj == 1 & VD4002 == . & Trimestre == 2
replace flh_eraativo = 0 if ehflh == 1 & VD4002 == . & Trimestre == 2

bysort UPA V1008 V1014 per: egen cnj_ativo = total(cnj_eraativo) , missing
bysort UPA V1008 V1014 per: egen flh_ativo = total(flh_eraativo) , missing



* 1) Idade:
gen idade = V2009 if (ehchf == 1 | ehcnj == 1 | ehflh == 1)
tabstat idade [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0)))

tabstat idade [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0)

* 2) renda dom
tabstat rendadom [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0)))

tabstat rendadom [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0)

* 3) Anos de Estudo
gen ae = VD3005 if (ehchf == 1 | ehcnj == 1 | ehflh == 1)
tabstat ae [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0)))

tabstat ae [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0)

* 4) Quantidade de brancos/amarelos:
gen branco = 1 if (ehchf == 1 | ehcnj == 1 | ehflh == 1) & raca == 0 
bysort UPA V1008 V1014 per: egen totbranco = total(branco) , missing
replace totbranco = . if V2005 != 1

tabstat totbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0)))

tabstat totbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0)


* 5) Quantidade de Pretos/Pardos/Indígenas:
gen ñbranco = 1 if (ehchf == 1 | ehcnj == 1 | ehflh == 1) & raca == 1 
bysort UPA V1008 V1014 per: egen totñbranco = total(ñbranco) , missing
replace totñbranco = . if V2005 != 1

tabstat totñbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 1 | (flh_ativo != . & flh_ativo != 0) | (cnj_ativo == 1 & (flh_ativo != . & flh_ativo != 0)))

tabstat totñbranco [w=V1028] if Trimestre == 2 & temcnj == 1 & temflh == 1 & _weight != . & (cnj_ativo == 0 & flh_ativo == 0)
