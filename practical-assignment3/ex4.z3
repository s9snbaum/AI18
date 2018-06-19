(set-option :produce-models true)

(declare-datatypes () ((Plant apple banana cherry rose tulip lily onion carrot pepper)))
(declare-datatypes () ((Garden garden1 garden2 garden3 garden4)))

(declare-fun Fruit (Plant) Bool)
(declare-fun Flower (Plant) Bool)
(declare-fun Vegetable (Plant) Bool)

(declare-fun GrowsIn (Plant Garden) Bool)


(assert (forall ((x Plant)) (= (Fruit x) (or (= x apple) (= x banana) (= x cherry)))))
(assert (forall ((x Plant)) (= (Flower x) (or (= x rose) (= x tulip) (= x lily)))))
(assert (forall ((x Plant)) (= (Vegetable x) (or (= x onion) (= x carrot) (= x pepper)))))


;; TODO: constraint 1
(assert (forall ((x Plant)) (or (Fruit x) (Flower x) (Vegetable x))))

;; TODO: constraint 2
(assert
(forall ((x Garden))
	(exists ((y1 Plant) (y2 Plant) (y3 Plant))
		(and (GrowsIn y1 x)
		     (GrowsIn y2 x)
		     (GrowsIn y3 x)
		     (distinct y1 y2 y3)
		     (forall ((y Plant)) (=> (GrowsIn y x) (or (= y y1) (= y y2) (= y y3))))
		)
	)
))

;; TODO: constraint 3
(assert (forall ((x Plant)) (exists ((y Garden)) (GrowsIn x y))))

;; TODO: constraint 4
(declare-fun hasThree (Garden) Bool)
(assert
(forall ((x Garden))
	(= (hasThree x) (exists ((y1 Plant) (y2 Plant) (y3 Plant))
	   	     		(and (GrowsIn y1 x)
				     (GrowsIn y2 x)
				     (GrowsIn y3 x)
				     (Fruit y1)
				     (Fruit y2)
				     (Fruit y3)
				     (distinct y1 y2 y3)
				)
			)
	)
))

(assert (distinct (distinct (hasThree garden1) (hasThree garden2)) (distinct (hasThree garden3) (hasThree garden4))))

;; TODO: constraint 5
(assert (exists ((y1 Plant) (y2 Plant) (y3 Plant) (x1 Garden) (x2 Garden) (x3 Garden) (x4 Garden) (x5 Garden) (x6 Garden))
		(and (Vegetable y1) (Fruit y2) (Fruit y3)
		     (GrowsIn y1 x1) (GrowsIn y1 x2)
		     (GrowsIn y2 x3) (GrowsIn y2 x4)
		     (GrowsIn y3 x5) (GrowsIn y3 x6)
		     (distinct y2 y3)
		     (distinct x1 x2)
		     (distinct x3 x4)
		     (distinct x5 x6)
		     (forall ((y4 Plant)) (=> (and (distinct y4 y1) (distinct y4 y2) (distinct y4 y3))
		     	     	  	      (forall ((x7 Garden) (x8 Garden)) (=> (and (GrowsIn y4 x7) (GrowsIn y4 x8)) (= x7 x8)))
					  )
		     )
		)
	)
)

;; TODO: constraint 6
(assert (forall ((x1 Garden) (x2 Garden)) (=> (and (GrowsIn rose x1) (GrowsIn carrot x2)) (distinct x1 x2))))

;; TODO: constraint 7
(assert (forall ((x Garden) (y1 Plant))
		(=> (and (GrowsIn y1 x) (= y1 tulip))
		    (exists ((y2 Plant)) (and (GrowsIn y2 x) (Flower y2) (distinct y1 y2)))))
)

;; TODO: constraint 8
(assert (exists ((y1 Plant) (y2 Plant) (y3 Plant)) (and (GrowsIn y1 garden1) (GrowsIn y2 garden1) (GrowsIn y3 garden1)
		     	    	       	   	   	(Flower y1) (Vegetable y2) (Fruit y3)))
)

;; TODO: constraint 9
(assert (forall ((y1 Plant)) (=> (GrowsIn y1 garden2) (not (Flower y1))))
)

;; TODO: constraint 10
(assert (exists ((y1 Plant) (y2 Plant) (y3 Plant)) (and (GrowsIn y1 garden1) (GrowsIn y2 garden4) (GrowsIn y3 garden3)
		     	    	       	   	   	(= y1 carrot) (= y2 carrot) (= y3 banana)))
)





;; check and print model
(check-sat)

(echo "garden1:")
(get-value ((GrowsIn apple garden1) (GrowsIn banana garden1) (GrowsIn cherry garden1) (GrowsIn rose garden1) (GrowsIn tulip garden1) (GrowsIn lily garden1) (GrowsIn onion garden1) (GrowsIn carrot garden1) (GrowsIn pepper garden1)))

(echo "garden2:")
(get-value ((GrowsIn apple garden2) (GrowsIn banana garden2) (GrowsIn cherry garden2) (GrowsIn rose garden2) (GrowsIn tulip garden2) (GrowsIn lily garden2) (GrowsIn onion garden2) (GrowsIn carrot garden2) (GrowsIn pepper garden2)))

(echo "garden3:")
(get-value ((GrowsIn apple garden3) (GrowsIn banana garden3) (GrowsIn cherry garden3) (GrowsIn rose garden3) (GrowsIn tulip garden3) (GrowsIn lily garden3) (GrowsIn onion garden3) (GrowsIn carrot garden3) (GrowsIn pepper garden3)))

(echo "garden4:")
(get-value ((GrowsIn apple garden4) (GrowsIn banana garden4) (GrowsIn cherry garden4) (GrowsIn rose garden4) (GrowsIn tulip garden4) (GrowsIn lily garden4) (GrowsIn onion garden4) (GrowsIn carrot garden4) (GrowsIn pepper garden4)))
(echo "")



;; TODO: statements (a-c) to prove
(assert (not (and
	;; (a)
	(GrowsIn lily garden1)
	;; (b)
     	(exists ((y Plant)) (and (Fruit y) (GrowsIn y garden2) (GrowsIn y garden3)))
	;; (c)
	(forall ((x1 Garden) (x2 Garden)) (=> (and (GrowsIn tulip x1) (GrowsIn rose x2)) (= x1 x2)))
)))

;; check for unsatisfiability
(check-sat)