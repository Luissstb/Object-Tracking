# Object-Tracking

Este repositorio alberga un sistema de Visión Artificial desarrollado en MATLAB, diseñado para la detección y el seguimiento inteligente de objetos en movimiento. Su núcleo algorítmico se fundamenta en un clasificador de múltiples esferas en el espacio de color RGB, reforzado con técnicas de sustracción de fondo y memoria de posición (tracking del centroide) para garantizar un rastreo robusto frente a objetos estáticos u otras interferencias visuales.

El desarrollo del proyecto se articula en un flujo metodológico de cinco fases:

    Captura de material: Grabación de imágenes y secuencias de entrenamiento.

    Extracción de datos: Muestreo de color y eliminación automática de valores atípicos (outliers).

    Diseño del clasificador: Construcción del modelo matemático de esferas de decisión.

    Calibración: Ajuste de umbrales morfológicos para la eliminación de ruido binarizado.

    Seguimiento en vídeo: Aplicación del rastreo final combinando color, movimiento temporal y distancia espacial.


Nota sobre la ejecución: Debido a las restricciones de almacenamiento de GitHub, no se incluyen los archivos de vídeo (.avi) ni los datasets pesados (.mat) correspondientes a mi entrenamiento original; replicar las primeras fases requerirá que el usuario genere su propio material. No obstante, el repositorio sí incluye el conjunto de datos facilitado por el profesor, lo que permite ejecutar y evaluar directamente los scripts de la fase final de seguimiento sin necesidad de configuraciones previas.
