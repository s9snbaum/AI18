(define (domain rush-hour)
    (:requirements :typing :strips)
    (:types position car - object)

    (:predicates
        (ADJACENT ?p1 - position ?p2 - position ?p3 - position)
        (SMALL ?c - car)
        (LARGE ?c - car)
        (isOccupied ?p - position)
        (containsCar ?p - position ?c - car)
    )

    (:action move-small
        :parameters (?c - car ?p1 - position ?p2 - position ?p3 - position)
        :precondition (and
	    ;TODO
	    (ADJACENT ?p1 ?p2 ?p3)
	    (SMALL ?c)
            (containsCar ?p1 ?c)
	    (containsCar ?p2 ?c)
	    (not (isOccupied ?p3))
        )
        :effect (and
	    ;TODO
            (containsCar ?p3 ?c)
	    (isOccupied ?p3)
	    (not (containsCar ?p1 ?c))
	    (not (isOccupied ?p1))
        )
    )

    (:action move-large
        :parameters (?c - car ?p1 - position ?p2 - position ?p3 - position ?p4 - position)
        :precondition (and
	    ;TODO
	    (ADJACENT ?p1 ?p2 ?p3)
	    (ADJACENT ?p2 ?p3 ?p4)
	    (LARGE ?c)
	    (containsCar ?p1 ?c)
	    (containsCar ?p2 ?c)
	    (containsCar ?p3 ?c)
	    (not (isOccupied ?p4))
        )
        :effect (and
	    ;TODO
            (containsCar ?p4 ?c)
	    (isOccupied ?p4)
	    (not (containsCar ?p1 ?c))
	    (not (isOccupied ?p1))
        )
    )
)
