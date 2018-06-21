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
            ;; TODO
        )
        :effect (and
            ;; TODO
        )
    )

    (:action move-large
        :parameters (?c - car ?p1 - position ?p2 - position ?p3 - position ?p4 - position)
        :precondition (and
            ;; TODO
        )
        :effect (and
            ;; TODO
        )
    )
)
