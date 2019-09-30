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
Al igual que el metodo anterior, para la imagen/video, por cada pixel, se extraen los colores RGB de este, pero en lugar de sacar el promedio de estos se le da a cada color un peso, este peso se multiplicara por el valor de cada color extraido, se sumaran los tres resultados y con este resultado final se actualizara el pixel. Para el Rojo, el peso será de 0.21; para el verde, el  peso sera de 0.72; y para el azul el peso sera de 0.07, respectivamente

### Despliegue del histograma
### Segmentación de la imagen a partir del histograma
### Medición de la eficiencia computacional para las operaciones realizadas


## Entrega

* Plazo para hacer _push_ del repositorio a github: 29/9/19 a las 24h.
