(define (domain rush-hour)
    (:requirements :typing :strips)
    (:types num car - object)

    (:predicates
        (plusone ?p1 - num ?p2 - num)
        (isOccupied ?px ?py - num)
        (carTail ?c - car ?px ?py - num)
        (carHead ?c - car ?px ?py - num)
    )

    (:action move-down
        :parameters (?c - car ?px - num ?p1y - num ?p2y - num ?p3y - num ?p4y - num)
        :precondition (and
            ;; TODO
	    (carHead ?c ?px ?p3y)
	    (carTail ?c ?px ?p1y)
	    (plusone ?p3y ?p4y)
	    (plusone ?p1y ?p2y)
	    (not (isOccupied ?px ?p4y))
        )
        :effect (and
            ;; TODO
	    (carHead ?c ?px ?p4y)
	    (carTail ?c ?px ?p2y)
	    (isOccupied ?px ?p4y)
	    (not (carHead ?c ?px ?p3y))
	    (not (carTail ?c ?px ?p1y))
	    (not (isOccupied ?px ?p1y))
        )
    )

    (:action move-up
        :parameters (?c - car ?px - num ?p1y - num ?p2y - num ?p3y - num ?p4y - num)
        :precondition (and
            ;; TODO
	    (carHead ?c ?px ?p4y)
	    (carTail ?c ?px ?p2y)
	    (plusone ?p3y ?p4y)
	    (plusone ?p1y ?p2y)
	    (not (isOccupied ?px ?p1y))
        )
        :effect (and
            ;; TODO
	    (carHead ?c ?px ?p3y)
	    (carTail ?c ?px ?p1y)
	    (isOccupied ?px ?p1y)
	    (not (carHead ?c ?px ?p4y))
	    (not (carTail ?c ?px ?p2y))
	    (not (isOccupied ?px ?p4y))
        )
    )
    
    (:action move-left
        :parameters (?c - car ?py - num ?p1x - num ?p2x - num ?p3x - num ?p4x - num)
        :precondition (and
            ;; TODO
	    (carHead ?c ?p4x ?py)
	    (carTail ?c ?p2x ?py)
	    (plusone ?p3x ?p4x)
	    (plusone ?p1x ?p2x)
	    (not (isOccupied ?p1x ?py))
        )
        :effect (and
            ;; TODO
	    (carHead ?c ?p3x ?py)
	    (carTail ?c ?p1x ?py)
	    (isOccupied ?p1x ?py)
	    (not (carHead ?c ?p4x ?py))
	    (not (carTail ?c ?p2x ?py))
	    (not (isOccupied ?p4x ?py))
        )
    )
    
    (:action move-right
        :parameters (?c - car ?py - num ?p1x - num ?p2x - num ?p3x - num ?p4x - num)
        :precondition (and
            ;; TODO
	    (carHead ?c ?p3x ?py)
	    (carTail ?c ?p1x ?py)
	    (plusone ?p3x ?p4x)
	    (plusone ?p1x ?p2x)
	    (not (isOccupied ?p4x ?py))
        )
        :effect (and
            ;; TODO
	    (carHead ?c ?p4x ?py)
	    (carTail ?c ?p2x ?py)
	    (isOccupied ?p4x ?py)
	    (not (carHead ?c ?p3x ?py))
	    (not (carTail ?c ?p1x ?py))
	    (not (isOccupied ?p1x ?py))
        )
    )
    
)
