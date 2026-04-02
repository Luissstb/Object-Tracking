# Object-Tracking

Este repositorio alberga un sistema de Visión Artificial desarrollado en MATLAB, diseñado para la detección y el seguimiento inteligente de objetos en movimiento. Su núcleo algorítmico se fundamenta en un clasificador de múltiples esferas en el espacio de color RGB, reforzado con técnicas de sustracción de fondo y memoria de posición (tracking del centroide) para garantizar un rastreo robusto frente a objetos estáticos u otras interferencias visuales.

El desarrollo del proyecto se articula en un flujo metodológico de cinco fases:

    Captura de material: Grabación de imágenes y secuencias de entrenamiento.

    Extracción de datos: Muestreo de color y eliminación automática de valores atípicos (outliers).

    Diseño del clasificador: Construcción del modelo matemático de esferas de decisión.

    Calibración: Ajuste de umbrales morfológicos para la eliminación de ruido binarizado.

    Seguimiento en vídeo: Aplicación del rastreo final combinando color, movimiento temporal y distancia espacial.


Nota sobre la ejecución: Todos los modelos matemáticos y datasets generados durante el proyecto (.mat) se encuentran incluidos en el repositorio. Sin embargo, debido a las restricciones de peso de GitHub, el vídeo original de entrenamiento (.avi) ha sido omitido. Para ejecutar los primeros scripts desde cero, será necesario emplear un vídeo propio. Adicionalmente, se incluye el material de prueba facilitado por la asignatura, lo que permite ejecutar y evaluar el algoritmo de seguimiento final directamente.
