# Título del Proyecto: Práctica de Planificadores

Este proyecto se enfoca en elaborar un planificador de libros utilizando PDDL (Plan Domain Definition Language). 

## Distribución de Documentos 🚀

Este trabajo incluye varios documentos y archivos para una comprensión integral de los planificadores:

1. **Informe del Trabajo**: Encontrarás el informe completo en `Práctica_de_planificadores.pdf`.

2. **Código .pddl**: Los archivos de código se dividen en tres carpetas, cada una conteniendo el dominio del pddl (nombrado como `_dom.pddl`) y dos conjuntos de pruebas específicos para ese dominio.
   - Nivel_Basico
   - Extension_1
   - Extension_2

3. **Extensión Final**: El archivo `ultim_dom.pddl`, correspondiente a la extensión final, se encuentra en el directorio principal. 

4. **Juegos de Pruebas**: La carpeta `Juegos_pruebas` contiene los juegos de prueba para la extensión final `ultim_dom.pddl`.

## Juegos de Pruebas ⚙️

Los juegos de pruebas se dividen en dos categorías: pruebas manuales y pruebas aleatorias. A continuación se detalla cómo ejecutarlas:

### Pruebas Manuales 🔩

Para ejecutar las pruebas manuales, utiliza los problemas `11_lib_paral_pred_vez.pddl`, `11_obj_intermed_seq.pddl`, `11_obj_intermed_seq_read.pddl`, `11_paral_pred_lib_notobjec.pddl` con el dominio `ultim_dom.pddl`.

### Pruebas Aleatorias ⌨️

Las pruebas aleatorias se encuentran en el archivo `generador.ipynb`. Debes ejecutar las celdas de este archivo Jupyter para generar y ejecutar las pruebas. Los experimentos están estructurados de la siguiente manera en el notebook:
- **Preparación**: Código necesario para configurar los experimentos.
- **Experimento Predecesor**: Código para el experimento Predecesor.
- **Experimento Paralelo**: Código para el experimento Paralelo.

⚠️ **Advertencia**: La función `ejecutar_programa` puede generar errores si no se ejecuta en un entorno Windows, ya que está diseñada para ejecutar programas directamente en este sistema operativo.

## Autores ✒️

- Artur Aubach Altes
- Daniel López García
