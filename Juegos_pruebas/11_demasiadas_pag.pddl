 ;./metricff -O -o Nivell_basic/11_dom.pddl -f Nivell_basic/11.pddl
(define (problem vector1)
    (:domain booksM3)
    (:objects
        ll_1 - libro
        enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre - mes
    )
    ;metricff -o domain-extensio3.pddl -f joc_de_prova.pddl -O >> output.txt
    (:init
        ;Paginas libros
        (=(num_paginas ll_1) 900)

        ;Paginas mes a actual
        (= (paginas_totales) 0)

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
        (objectiu ll_1)
        (= (libros_restantes) 1)

    )

    (:goal
        (= (libros_restantes) 0)
    )

    (:metric minimize
        (libros_restantes)
    )

)