(define (problem rush-hour-p01)
    (:domain rush-hour)
    (:objects
        x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6  - num
        red car1 car3 car4 car5 car6 car10 car13 car14 car16 car17 car18 - car
    )
    (:init

    
        (plusone x1 x2)
        (plusone x2 x3)
        (plusone x3 x4)
        (plusone x4 x5)
        (plusone x5 x6)
        (plusone x6 x7)
        (plusone y1 y2)
        (plusone y2 y3)
        (plusone y3 y4)
        (plusone y4 y5)
        (plusone y5 y6)
        (plusone y6 y7)
    
    
        ;; TODO

        (isOccupied x1 y1)
        (isOccupied x4 y1)
        (isOccupied x5 y1)
        (isOccupied x6 y1)
        (isOccupied x1 y2)
        (isOccupied x3 y2)
        (isOccupied x4 y2)
        (isOccupied x5 y2)
        (isOccupied x6 y2)
        (isOccupied x1 y3)
        (isOccupied x2 y3)
        (isOccupied x3 y3)
        (isOccupied x4 y3)
        (isOccupied x5 y3)
        (isOccupied x6 y3)
        (isOccupied x1 y4)
        (isOccupied x2 y4)
        (isOccupied x3 y4)
        (isOccupied x4 y4)
        (isOccupied x5 y4)
        (isOccupied x6 y4)
        (isOccupied x4 y5)
        (isOccupied x5 y5)
        (isOccupied x6 y5)
        (isOccupied x2 y6)
        (isOccupied x3 y6)
        (isOccupied x4 y6)
        (carHead car1 x1 y2)
        (carTail car1 x1 y1)
        (carHead red x2 y3)
        (carTail red x1 y3)
        (carHead car3 x3 y4)
        (carTail car3 x3 y3)
        (carHead car4 x4 y4)
        (carTail car4 x4 y3)
        (carHead car5 x5 y4)
        (carTail car5 x5 y3)
        (carHead car6 x6 y4)
        (carTail car6 x6 y2)
        (carHead car10 x4 y6)
        (carTail car10 x4 y5)
        (carHead car13 x6 y1)
        (carTail car13 x4 y1)
        (carHead car14 x5 y2)
        (carTail car14 x3 y2)
        (carHead car16 x2 y4)
        (carTail car16 x1 y4)
        (carHead car17 x6 y5)
        (carTail car17 x5 y5)
        (carHead car18 x3 y6)
        (carTail car18 x2 y6)


    )
    (:goal (and
        (isOccupied 6 3)
        (isOccupied 5 3)
        (carHead red 6 3)
        (carTail red 5 3)
    ))
)
