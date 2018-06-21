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
        )
        :effect (and
            ;; TODO
        )
    )

    (:action move-up
        :parameters (?c - car ?px - num ?p1y - num ?p2y - num ?p3y - num ?p4y - num)
        :precondition (and
            ;; TODO
        )
        :effect (and
            ;; TODO
        )
    )
    
    (:action move-left
        :parameters (?c - car ?py - num ?p1x - num ?p2x - num ?p3x - num ?p4x - num)
        :precondition (and
            ;; TODO
        )
        :effect (and
            ;; TODO
        )
    )
    
    (:action move-right
        :parameters (?c - car ?py - num ?p1x - num ?p2x - num ?p3x - num ?p4x - num)
        :precondition (and
            ;; TODO
        )
        :effect (and
            ;; TODO
        )
    )
    
)
