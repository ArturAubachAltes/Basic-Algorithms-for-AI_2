(define (domain booksM1)
    (:requirements :strips :adl :typing :fluents)
    (:types
        libro mes - object
    )

    (:predicates
        (objectiu ?l - libro) ; Libros que quiere leer

        (predecesor ?l1 ?l2 - libro) ; Libro predecesor
        (es_sucesor ?l - libro) ;el libro es sucparaleloesor

        (leido_en_mes ?l - libro ?m - mes) ; Indica si un libro está asignado a un mes
        (leido ?l - libro) ;el libro se ha leido

        (siguiente_mes ?m1 ?m2 - mes) ; Orden meses

        (mes_actual ?m - mes) ;mes actual
    )

    (:functions
        (libros_restantes) ; Número de libros restantes
    )

    (:action leer_no_sucesor_
        :parameters (?libro - libro ?month - mes)
        :precondition (and
            (mes_actual ?month)
            (not (leido ?libro)) ;el libro no ha estado leido
            (not (es_sucesor ?libro))
        )

        :effect (and
            (leido_en_mes ?libro ?month)
            (leido ?libro)
            (when
                (objectiu ?libro)
                (decrease (libros_restantes) 1))
        )
    )

    (:action leer_sucesor
        :parameters (?libro - libro ?month - mes)
        :precondition (and
            (mes_actual ?month)
            (not (leido ?libro)) ; el libro no ha sido leído
            (es_sucesor ?libro) ; el libro es sucesor
            (forall
                (?l1 - libro)
                    (imply
                        (predecesor ?l1 ?libro)
                        (and (leido ?l1)
                            (not (leido_en_mes ?l1 ?month))
                        ) ; que se lea en un mes diferente a aquellos en los que se leyeron sus libros predecesores.
                    )
                )
            )
        :effect (and
            (leido_en_mes ?libro ?month)
            (leido ?libro)
            (when
                (objectiu ?libro)
                (decrease (libros_restantes) 1))
        )
    )

    (:action canviar_mes
        :parameters (?acual_month ?next_month - mes)
        :precondition (and
            (mes_actual ?acual_month)
            (siguiente_mes ?acual_month ?next_month))

        :effect (and
            (not (mes_actual ?acual_month)) ; Elimina el valor actual de mes_actual
            (mes_actual ?next_month) ; Añade el nuevo valor a mes_actual 
        )
    )
)