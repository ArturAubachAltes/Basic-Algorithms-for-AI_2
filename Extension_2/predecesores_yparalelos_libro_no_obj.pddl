 ;./metricff -O -o Nivell_basic/11_dom.pddl -f Nivell_basic/11.pddl
(define (problem vector1)
    (:domain booksM2)
    (:objects
        ll_1 ll_1_2 ll_2 ll_2_1 ll_99 ll_3 ll_4 ll_5 ll_1_3 ll_1_4 - libro
        enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes

    )
    ;metricff -o domain-extensio3.pddl -f joc_de_prova.pddl -O >> output.txt
    (:init

        ;mes consecutivo
        (siguiente_mes enero febrero)
        (siguiente_mes febrero marzo)
        (siguiente_mes marzo abril)
        (siguiente_mes abril mayo)
        (siguiente_mes mayo junio)
        (siguiente_mes junio julio)
        (siguiente_mes julio agosto)
        (siguiente_mes agosto septiembre)
        (siguiente_mes septiembre octubre)
        (siguiente_mes octubre noviembre)
        (siguiente_mes noviembre diciembre)

        ;mes actual
        (mes_actual enero)

        ;objetivos
        (objectiu ll_5)
        (objectiu ll_2_1)
        ;(objectiu ll_99)

        ;num objetivos
        (= (libros_restantes) 2)

        ;predecesores
        (predecesor ll_1 ll_1_2)
        (predecesor ll_1_2 ll_1_3)
        (predecesor ll_1_3 ll_99)

        ;indica si el libro es sucesor
        (es_sucesor ll_1_2)
        (es_sucesor ll_1_3)
        ;(es_sucesor ll_99)

        ;paralelo
        (paralelo ll_4 ll_1_2)

        ;indica si el libro es paralelo
        (es_paralelo ll_4)
        (es_paralelo ll_1_2)



    )

    (:goal
        (= (libros_restantes) 0)
    )

    (:metric minimize
        (libros_restantes)
    )

)