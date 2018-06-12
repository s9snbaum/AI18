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
		     (not (= y1 y2))
		     (not (= y2 y3))
		     (not (= y1 y3))
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
				     (= y1 apple)
				     (= y2 banana)
				     (= y3 cherry)
				)
			)
	)
)

(assert (distinct (distinct (hasThree garden1) (hasThree garden2)) (distinct (hasThree garden3) (hasThree garden4))))

;; TODO: constraint 5


;; TODO: constraint 6


;; TODO: constraint 7


;; TODO: constraint 8


;; TODO: constraint 9


;; TODO: constraint 10


;; TODO: statements (a-c) to prove




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
