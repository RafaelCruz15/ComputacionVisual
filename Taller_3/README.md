# Taller raster

## Propósito

Comprender algunos aspectos fundamentales del paradigma de rasterización.

## Tareas

Emplee coordenadas baricéntricas para:

1. Rasterizar un triángulo.
2. Sombrear su superficie a partir de los colores de sus vértices.
3. Implementar un [algoritmo de anti-aliasing](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) para sus aristas.

Referencias:

* [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/)
* [Rasterization stage](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage)
* [FXAA](http://blog.simonrodriguez.fr/articles/30-07-2016_implementing_fxaa.html)

Implemente la función ```triangleRaster()``` del sketch adjunto para tal efecto, requiere la librería [nub](https://github.com/visualcomputing/nub/releases) (versión >= 0.2).

## Integrantes

Complete la tabla:

| Integrante                      | github nick   |
|---------------------------------|---------------|
| Hernando Jose Caviedes Barboza  | hjcaviedesb   |
| Nidia Alejandra Bautista Lopez  |  nabautistal  |
| Edgar Rafael Cruz Rodriguez     | RafaelCruz15  |


## Discusión

Describa los resultados obtenidos. En el caso de anti-aliasing describir las técnicas exploradas, citando las referencias.

* Para realizar la rasterización (Raster)  del triángulo lo que se requirió hacer fue iterar a través de los píxeles de la pantalla y averiguar si     algunos de esos pixeles sobrelapan la imagen "proyectada" por el triángulo.Eso es lo que se le llama en algunas APIs gráficas el inside-outside test o el coverage test.La manera para averiguar si un pixel se encuentra dentro del triángulo se hace a través de una técnicas que se le conoce como la edge función, el cual nos brinda información importante acerca de la posición del píxel dentro del triángulo, lo cual se le conoce como la coordenada baricéntrica.

* El antialiasing también conocido como el suavizado,  es un conjunto de técnicas utilizadas para mejorar la calidad final de la imagen, por la facilidad nos valimos del algoritmo FXAA, FXAA es el acrónimo de Fast Approximate Anti-Aliasing,y es una técnica cuyo objetivo es mejorar la calidad, sin perder velocidad.


## Entrega

* Plazo: ~~20/10/19~~ 27/10/19 a las 24h.
