
; Declare the needed predicates
(declare-fun p (Int Int) Bool)
(declare-fun q (Int Int) Bool)
(declare-fun r (Int Int) Bool)


; Assert the given facts from the assignment

; 1.
(assert (forall ((x Int)) (exists ((y Int)) (p x y))))

; 2.
(assert (forall ((x Int)) (exists ((y Int)) (q x y))))

; 3.
(assert (forall ((x Int) (y Int)) (=> (or (p x y) (q x y))
	    	    	      	    (forall ((z Int)) (=> (or (p y z) (q y z))
			      	      	      	    	(r x z)
					      	      )
			 	    )
	    	    	          )
        )
)


(check-sat)

