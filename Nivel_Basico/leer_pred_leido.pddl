(define (problem vector1)
    (:domain books1)
    (:objects
        ll_1 ll_1_2 ll_1_3 ll_2 ll_2_2 ll_2_3 ll_3 ll_4 ll_5
    )
    (:init
        (objectiu ll_1_2)
        (predecesor ll_1 ll_1_2)
        ; Indicar los libros que ya han sido leídos (si aplica)
        (leido ll_1_2)
    )

    (:goal
        (forall
            (?libro)
            (imply
                (objectiu ?libro)
                (leido ?libro))
        )
    )
)
