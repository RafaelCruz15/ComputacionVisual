# Taller de análisis de imágenes por software

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises: promedio _rgb_ y [luma](https://en.wikipedia.org/wiki/HSL_and_HSV#Disadvantages).
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

## Integrantes

Completar la tabla:

| Integrante                      | github nick   |
|---------------------------------|---------------|
| Hernando Jose Caviedes Barboza  | hjcaviedesb   |
| Nidia Alejandra Bautista Lopez  |  nabautistal  |
| Edgar Rafael Cruz Rodriguez     | RafaelCruz15  |

## Discusión

(describa brevemente las actividades realizadas y los resultados obtenidos)
### Conversión a escala de grises
* Metodo del promedio: RGB

Por cada pixel del video/imagen se extrae el valor de los colores primarios de la luz, RGB, despues de obtener los valores se promedian,despues con el valor obtenido se actualiza el pixel.
* Luma

Al igual que el metodo anterior, para la imagen/video, por cada pixel, se extraen los colores RGB de este, pero en lugar de sacar el promedio de estos se le da a cada color un peso, este peso se multiplicara por el valor de cada color extraido, se sumaran los tres resultados y con este resultado final se actualizara el pixel. Para el Rojo, el peso será de 0.21; para el verde, el  peso sera de 0.72; y para el azul el peso sera de 0.07, respectivamente.
### Mascaras de convolución
Para las mascaras de convolución se utilizaron los siguientes efectos: enfoque(sharpen), desenfoque(blur), detección de bordes(edge detection) e identidad.

### Despliegue del histograma
Despues de obtenida la imagen a escala de grises se imprime un histograma, en donde se representa la frecuencia de las tonalidades de grisese que se pueden encontrar en la imagen.
### Segmentación de la imagen a partir del histograma
Sobre el histograma obtenido apartir de la imagen en escala de grises, se selecciona un rango de interés con el mouse,como resultado de esto se mostarán los pixeles del rango seleccionado de la imagen.
### Medición de la eficiencia computacional para las operaciones realizadas
Se midieron los fps con el comando frameRate, al principio, con el video usado, comienza en un rango de 20 fps y va aumentado paulatinamente hasta estar en un estado menos variable entre 40 y 43 fps, esto solo cambia cuando se utiliza el filtro edge detection cuando los fps cambia momentaneamente a 39 fps.

## Entrega

* Plazo para hacer _push_ del repositorio a github: 29/9/19 a las 24h.
