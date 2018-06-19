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


;; constraint 1: Any plant is either a fruit, a flower, or a vegetable.
(assert (forall ((x Plant)) (or (Fruit x) (Flower x) (Vegetable x))))


;; constraint 2: Everybody grows exactly 3 different plants.
(assert
(forall ((x Garden))
	;; there are at least three plants that grow in x
	(exists ((y1 Plant) (y2 Plant) (y3 Plant))
		(and (GrowsIn y1 x)
		     (GrowsIn y2 x)
		     (GrowsIn y3 x)
		     (distinct y1 y2 y3)
		     ;; and there is no other plant in this garden that is different from all of these three (at most three plants)
		     (forall ((y Plant)) (=> (GrowsIn y x) (or (= y y1) (= y y2) (= y y3))))
		)
	)
))


;; constraint 3: Every plant is in at least one garden.
(assert (forall ((x Plant)) (exists ((y Garden)) (GrowsIn x y))))


;; constraint 4: Exactly one garden has all 3 kinds of fruits.

;; define hasThree(x) <=> garden x has all three kinds of fruit
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

;; assert that exactly one garden satisfies this predicate
(assert (distinct (distinct (hasThree garden1) (hasThree garden2)) (distinct (hasThree garden3) (hasThree garden4))))


;; constraint 5: Exactly 3 plants are in 2 or more gardens and they are one vegetable and two fruits.
(assert (exists ((y1 Plant) (y2 Plant) (y3 Plant) (x1 Garden) (x2 Garden) (x3 Garden) (x4 Garden) (x5 Garden) (x6 Garden))
		;; for each of the three plants exist two distinct gardens that they grow in
		(and (Vegetable y1) (Fruit y2) (Fruit y3)
		     (GrowsIn y1 x1) (GrowsIn y1 x2)
		     (GrowsIn y2 x3) (GrowsIn y2 x4)
		     (GrowsIn y3 x5) (GrowsIn y3 x6)
		     (distinct y2 y3)
		     (distinct x1 x2)
		     (distinct x3 x4)
		     (distinct x5 x6)
		     ;; every plant that is not one of those three can only grow in a single garden
		     (forall ((y4 Plant)) (=> (and (distinct y4 y1) (distinct y4 y2) (distinct y4 y3))
		     	     	  	      (forall ((x7 Garden) (x8 Garden)) (=> (and (GrowsIn y4 x7) (GrowsIn y4 x8)) (= x7 x8)))
					  )
		     )
		)
	)
)

;; constraint 6: There is no garden that grows both rose and carrots.
;; if there are gardens that contain a rose and a carrot, respectively, then they must be distinct.
(assert (forall ((x1 Garden) (x2 Garden)) (=> (and (GrowsIn rose x1) (GrowsIn carrot x2)) (distinct x1 x2))))

;; constraint 7: Any garden with tulip has another flower.
(assert (forall ((x Garden) (y1 Plant))
		(=> (and (GrowsIn y1 x) (= y1 tulip))
		    (exists ((y2 Plant)) (and (GrowsIn y2 x) (Flower y2) (distinct y1 y2)))))
)

;; constraint 8: Garden1 has one fruit, one vegetable and one flower.
(assert (exists ((y1 Plant) (y2 Plant) (y3 Plant)) (and (GrowsIn y1 garden1) (GrowsIn y2 garden1) (GrowsIn y3 garden1)
		     	    	       	   	   	(Flower y1) (Vegetable y2) (Fruit y3)))
)

;; constraint 9: Garden2 has no flowers.
(assert (forall ((y1 Plant)) (=> (GrowsIn y1 garden2) (not (Flower y1))))
)

;; constraint 10: Gardens 1 and 4 have carrots and Garden3 has bananas.
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