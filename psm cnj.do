
* Dummys de transição, Dummys de raças, renda per capita, Dummys de UF. Para cada Transição, fazer uma dummy e para cada dummy um PSM com Outcome desse dummy em específico (e aí uma regressão). *
drop cnjOO cnjOD cnjOI cnjDO cnjDD cnjDI cnjIO cnjID cnjII

gen cnjOD = 0 if ehcnj == 1 & oo != . 
replace cnjOD = 1 if ehcnj == 1 & od != .
gen cnjOI = 0 if ehcnj == 1 & oo != .
replace cnjOI = 1 if ehcnj == 1 & oi != .

gen cnjDO = 0 if ehcnj == 1 & dd != .
replace cnjDO = 1 if ehcnj == 1 & do != .
gen cnjDI = 0 if ehcnj == 1 & dd != .
replace cnjDI = 1 if ehcnj == 1 & di != .

gen cnjIO = 0 if ehcnj == 1 & ii != .
replace cnjIO = 1 if ehcnj == 1 & io != .
gen cnjID = 0 if ehcnj == 1 & ii != .
replace cnjID = 1 if ehcnj == 1 & id != .

gen dUF11 = 0
replace dUF11 = 1 if UF == 11

gen dUF12 = 0
replace dUF12 = 1 if UF == 12

gen dUF13 = 0
replace dUF13 = 1 if UF == 13

gen dUF14 = 0
replace dUF14 = 1 if UF == 14

gen dUF15 = 0
replace dUF15 = 1 if UF == 15

gen dUF16 = 0
replace dUF16 = 1 if UF == 16

gen dUF17 = 0
replace dUF17 = 1 if UF == 17

gen dUF21 = 0
replace dUF21 = 1 if UF == 21

gen dUF22 = 0
replace dUF22 = 1 if UF == 22

gen dUF23 = 0
replace dUF23 = 1 if UF == 23

gen dUF24 = 0
replace dUF24 = 1 if UF == 24

gen dUF25 = 0
replace dUF25 = 1 if UF == 25

gen dUF26 = 0
replace dUF26 = 1 if UF == 26

gen dUF27 = 0
replace dUF27 = 1 if UF == 27

gen dUF28 = 0
replace dUF28 = 1 if UF == 28

gen dUF29 = 0
replace dUF29 = 1 if UF == 29

gen dUF31 = 0
replace dUF31 = 1 if UF == 31

gen dUF32 = 0
replace dUF32 = 1 if UF == 32

gen dUF33 = 0
replace dUF33 = 1 if UF == 33

gen dUF35 = 0
replace dUF35 = 1 if UF == 35

gen dUF41 = 0
replace dUF41 = 1 if UF == 41

gen dUF42 = 0
replace dUF42 = 1 if UF == 42

gen dUF43 = 0
replace dUF43 = 1 if UF == 43

gen dUF50 = 0
replace dUF50 = 1 if UF == 50

gen dUF51 = 0
replace dUF51 = 1 if UF == 51

gen dUF52 = 0
replace dUF52 = 1 if UF == 52

gen dUF53 = 0
replace dUF53 = 1 if UF == 53

gen raca = 0 if V2010 == 1 | V2010 == 3
replace raca = 1 if V2010 == 2 | V2010 == 4 | V2010 == 5

gen habitante = 1 if V2005 >= 1 & V2005 <= 14
bysort UPA V1008 V1014 per: egen totalhab = total(habitante) , missing
gen urbano = 0 if V1022 == 2 
replace urbano = 1 if V1022 == 1
gen metropolitano = 0 if V1023 == 3 | V1023 == 4
replace metropolitano = 1 if V1023 == 1 | V1023 == 2

set seed 654654
gen v=uniform()
sort v
psmatch2 chfdesemp V2007 V2009 raca VD3005 dUF* dmano* totalhab urbano metropolitano if Trimestre == 2, n(1) common outcome(chfdesemp)


* Regressões usando os controles e tratamentos *

mlogit multinomialflhD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh D pos PSM.xls" , replace

mlogit multinomialflhO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh O pos PSM.xls" , replace

mlogit multinomialflhI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temcnj == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial flh I pos PSM.xls" , replace

mlogit multinomialcnjD chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . , vce(robust) baseoutcome(0)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj D pos PSM.xls" , replace

mlogit multinomialcnjO chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj O pos PSM.xls" , replace

mlogit multinomialcnjI chfdesemp dmano12 dmano13 dmano14 dmano15 dmano16 dmano17 dmano18 [iw=V1028] if temflh == 1 & _weight != . , vce(robust)
outreg2 using "P:\Matheus\TRANSIÇÃO NO MERCADO DE TRABALHO\Resultados\multinomial cnj I pos PSM.xls" , replace
