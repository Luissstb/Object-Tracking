clear, clc, close all
addpath('../funciones');
load('../01_GeneracionMaterial/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat');
load('../03_DisegnoClasificador/VariablesGeneradas/datos_multiples_esferas.mat');

figure; imshow(imgAlejada);
maskFar = roipoly;
numPix = round(sum(maskFar(:)) / 2);

if ~exist('VariablesGeneradas', 'dir'), mkdir('VariablesGeneradas'); end
save('VariablesGeneradas/umbral_conectividad.mat', 'numPix');

I = objPos1;
Ib = calcula_deteccion_multiples_esferas_en_imagen(I, datosMultiplesEsferas);

Ib_limpia = bwareaopen(Ib, numPix);

funcion_visualiza(I, Ib, Ib_limpia);