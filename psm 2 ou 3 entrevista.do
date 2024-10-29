log using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomiais.txt" , replace

mlogit multinomialflhD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != . & (entrevista == 2 | entrevista == 3) , vce(robust)


mlogit multinomialflhO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != .  & (entrevista == 2 | entrevista == 3) , vce(robust)


mlogit multinomialflhI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1  & _weight != . & (entrevista == 2 | entrevista == 3) , vce(robust)



mlogit multinomialcnjD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1  & _weight != . & (entrevista == 2 | entrevista == 3) , vce(robust)


mlogit multinomialcnjO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . & (entrevista == 2 | entrevista == 3) , vce(robust)



mlogit multinomialcnjI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . & (entrevista == 2 | entrevista == 3) , vce(robust)


log close
