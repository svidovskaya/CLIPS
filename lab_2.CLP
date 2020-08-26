(clear)
(deffunction ask (?question $?allowed)
(printout t ?question ?allowed)
(bind ?answer (read))
?answer
)

(deffunction ask-allowed (?question $?allowed)
(bind ?answer (ask ?question))
(while (not (member ?answer $?allowed) )
do
(printout t "Reenter, please" crlf)
(bind ?answer (ask ?question))
)
?answer
)

(defrule Pravilo_1
(not (Prav1 ?))
=>
(if (eq (ask-allowed "P1 - Medium sized cat? : Y-yes,N-no" Y N) Y)
then
	(if (eq (ask-allowed "P2 - Is there a distinguishing feature? : Y-yes,N-no" Y N) Y)
	then
		(if (eq (ask-allowed "P3 - Short thick coat? : Y-yes,N-no" Y N) Y)
		then
			(if (eq (ask-allowed "P4 - Round head? : Y-yes,N-no" Y N) Y)
			then
                             (if (eq (ask-allowed "P6 - Flattened face? : Y-yes,N-no" Y N) Y)
			          then
(if (eq (ask-allowed "P7 - long fluffy tail? : Y-yes,N-no" Y N) Y)
			then
                             (if (eq (ask-allowed "P9 - Small ears? : Y-yes,N-no" Y N) Y)
			          then

				(if (eq (ask-allowed "P10 - Big round eyes? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Scottish Fold"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
		else
		(assert(none))  
		)
	else
	(assert(none))
	)
else
(assert(P1,P2,P3)) ;Pr5
)
else(assert(P1,P2)); Pr9
)
else(assert(P1)) ;Pr2
)
else
(assert(Prav6))
)
)



(defrule Pravilo_2
(P1)
=>
		(if (eq (ask-allowed "P3 - Short thick coat? : Y-yes,N-no" Y N) Y)
		then
			(if (eq (ask-allowed "P4 - Round head? : Y-yes,N-no" Y N) Y)
			then
                             (if (eq (ask-allowed "P6 - Flattened face? : Y-yes,N-no" Y N) Y)
			          then
(if (eq (ask-allowed "P7 - long fluffy tail? : Y-yes,N-no" Y N) Y)
			then
                             (if (eq (ask-allowed "P9 - Small ears? : Y-yes,N-no" Y N) Y)
			          then

				(if (eq (ask-allowed "P10 - Big round eyes? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Scottish Strite"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
		else
		(assert(P1,P3,P4,P6)); pr3  
		)
	else
	(assert(P1,P3,P4,P6))
	)
else
(assert(none)) ;
)
else(assert(prav10)); Pr10
)
)


(defrule Pravilo_3
(P1,P3,P4,P6)
=>
(if (eq (ask-allowed "P10 - Big Round eyes? : Y-yes,N-no" Y N) Y)
			          then

				(if (eq (ask-allowed "P12 - Medium ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is british"))
				else
					(assert(P1,P3,P4,P6,P10)) ; pr4  
				)
			else
			(assert(none))
			)
		)

(defrule Pravilo_4
(P1,P3,P4,P6,P10)
=>

(if (eq (ask-allowed "P9 - Small ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Exotic"))
				else
					(assert(none)) ; 
				)
			
		)


(defrule Pravilo_6
(Prav6)
=>
(if (eq (ask-allowed "P2 - Is there a distinguishing feature? : Y-yes,N-no" Y N) Y)
	then
(if (eq (ask-allowed "P7 - long fluffy tail? : Y-yes,N-no" Y N) Y)
			then
                             (if (eq (ask-allowed "P8 - Big ears? : Y-yes,N-no" Y N) Y)
			          then
(if (eq (ask-allowed "P11 - Big cat with thick coat? : Y-yes,N-no" Y N) Y)
			          then

				(if (eq (ask-allowed "P13 - Squared muzzle? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Maine-Coon"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
		else
		(assert(Prav8)) ;pr8  
		)
	else
	(assert(P2)) ;Pr12
	)
else
(assert (Prav11))
)

)


(defrule Pravilo_5
(P1,P2,P3)
=>

(if (eq (ask-allowed "P5 - wedge-shaped head? : Y-yes,N-no" Y N) Y)
			          then

				(if (eq (ask-allowed "P12 - medium ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Bengal"))
				else
					(assert(P1,P2,P3,P5)) ; pr7 
				)
			else
			(assert(none))
			)
)
(defrule Pravilo_7
(P1,P2,P3,P5)
=>
(if (eq (ask-allowed "P8 - Big ears? : Y-yes,N-no" Y N) Y)
then
(assert(suggest "it is Siamese"))
				else
					(assert(none)) ; 
				)
)

(defrule Pravilo_11
(Prav11)
=>
(if (eq (ask-allowed "P4 - Round head? : Y-yes,N-no" Y N) Y)
			          then
(if (eq (ask-allowed "P6 - Flattened face? : Y-yes,N-no" Y N) Y)
			then
                             

				(if (eq (ask-allowed "P9 - Small ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Persidskaya"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
		else
		(assert(none))   
		)

)

(defrule Pravilo_8
(Prav8)
=>

(if (eq (ask-allowed "P4 - round head? : Y-yes,N-no" Y N) Y)
			then
                             
(if (eq (ask-allowed "P11 - Big cat with thick coat? : Y-yes,N-no" Y N) Y)
			then
				(if (eq (ask-allowed "P12 - medium ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Siberian"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
else
			(assert(none))
			)
)
(defrule Pravilo_9
(P1,P2)
=>

(if (eq (ask-allowed "P5 - wedge-shaped head? : Y-yes,N-no" Y N) Y)
			then
                             

				(if (eq (ask-allowed "P8 - Big ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Sfinx"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
)

(defrule Pravilo_12
(P2)
=>

(if (eq (ask-allowed "P5 - wedge-shaped head? : Y-yes,N-no" Y N) Y)
			then
                             

				(if (eq (ask-allowed "P8 - Big ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "it is Singaporean"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
)
(defrule Pravilo_10
(prav10)
=>

(if (eq (ask-allowed "P5 - wedge-shaped head? : Y-yes,N-no" Y N) Y)
			then
                (if (eq (ask-allowed "P7 - Long fluffy tail? : Y-yes,N-no" Y N) Y)
				then             

				(if (eq (ask-allowed "P8 - Big ears? : Y-yes,N-no" Y N) Y)
				then
					(assert(suggest "Angory"))
				else
					(assert(none))  
				)
			else
			(assert(none))
			)
else
			(assert(none))
			)
)

(defrule PrintSuggest
(suggest ?x)
=>
(printout t "====================" ?x "====================" crlf)
)

(defrule NoSuggest
(none)
;(not (suggest ?))   ;если assert(yy) не используется нигде в правилах
=>
(printout t "Sorry, no such cats was found." crlf)
)