(define (domain books)
    (:requirements :strips :adl)
    (:predicates
        (objectiu ?x) ; Libros que quiere leer
        (predecesor ?x ?y) ; Libro predecesor
        (leido ?x) ; Indica si ?x ha sido leído
    )

    (:action leer_objectiu
        :parameters (?libro)
        :precondition (and
            (objectiu ?libro)
            (not (leido ?libro))
            (forall
                (?x)
                (or (not (predecesor ?x ?libro)) (leido ?x)))
        )
        :effect (leido ?libro)
    )

    (:action leer_predecesor
        :parameters (?libro ?obj)
        :precondition (and
            (predecesor ?libro ?obj)
            (objectiu ?obj)
            (not (leido ?libro))
        )
        :effect (leido ?libro)
    )
)