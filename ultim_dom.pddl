(define (domain booksM3)
    (:requirements :strips :adl :typing :fluents)
    (:types
        libro mes - object
    )

    (:predicates
        (objectiu ?l - libro) ; Libros que quiere leer

        (predecesor ?l1 ?l2 - libro) ; Libro predecesor
        (es_sucesor ?l - libro) ;el libro es sucparaleloesor

        (paralelo ?l1 ?l2 - libro) ; Libro paralelo
        (es_paralelo ?l -libro) ;el libro es paralelo

        (leido_en_mes ?l - libro ?m - mes) ; Indica si un libro está asignado a un mes
        (leido ?l - libro) ;el libro se ha leido

        (siguiente_mes ?m1 ?m2 - mes) ; Orden meses

        (mes_actual ?m - mes) ;mes actual
    )

    (:functions
        (libros_restantes) ; Número de libros restantes
        (num_paginas ?l - libro) ; Número de páginas de un libro
        (paginas_totales) ; Número pg mes actual
    )

    (:action leer_no_sucesor_no_paralel
        :parameters (?libro - libro ?month - mes)
        :precondition (and
            (mes_actual ?month)
            (not (leido ?libro)) ;el libro no ha estado leido
            (not (es_sucesor ?libro))
            (not (es_paralelo ?libro))
            (<= (+ (paginas_totales) (num_paginas ?libro)) 800)
        )

        :effect (and
            (leido_en_mes ?libro ?month)
            (leido ?libro)
            (increase (paginas_totales) (num_paginas ?libro))
            (when
                (objectiu ?libro)
                (decrease (libros_restantes) 1))
        )
    )
    
    (:action leer_sucesor_y_paralelo1
        :parameters (?libro - libro ?month - mes ?pas_month - mes)
        :precondition (and
            (mes_actual ?month)
            (not (leido ?libro)) ; el libro no ha sido leído
            (siguiente_mes ?pas_month ?month) ; Identificar el mes pasado de ?month
            (or(es_sucesor ?libro) ; el libro es sucesor
            (es_paralelo ?libro))
            (<= (+ (paginas_totales) (num_paginas ?libro)) 800)
            (forall
                (?l1 - libro)
                (and
                    (imply
                        (paralelo ?l1 ?libro)
                        (and (leido ?l1)
                        (or (leido_en_mes ?l1 ?month)
                            (leido_en_mes ?l1 ?pas_month)
                        ))
                    )

                    (imply
                        (predecesor ?l1 ?libro)
                        (and (leido ?l1)
                            (not (leido_en_mes ?l1 ?month))
                        ) ; que se lea en un mes diferente a aquellos en los que se leyeron sus libros predecesores.
                    )
                    )
                )
        )
        :effect (and
            (leido_en_mes ?libro ?month)
            (leido ?libro)
            (increase (paginas_totales) (num_paginas ?libro))
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
            (assign (paginas_totales) 0)) ; Reinicia paginas_totales a 0
    )
)