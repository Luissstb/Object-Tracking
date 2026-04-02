clear, clc, close all
addpath('../funciones');
load('../01_GeneracionMaterial/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat');


figure; imshow(objPos1); title('Selecciona el COLOR DE SEGUIMIENTO');
maskColor = roipoly;
R = objPos1(:,:,1); G = objPos1(:,:,2); B = objPos1(:,:,3);
DatosColor = double([R(maskColor), G(maskColor), B(maskColor)]);


figure; imshow(fondo1); title('Selecciona una zona del FONDO');
maskFondo = roipoly;
Rf = fondo1(:,:,1); Gf = fondo1(:,:,2); Bf = fondo1(:,:,3);
DatosFondo = double([Rf(maskFondo), Gf(maskFondo), Bf(maskFondo)]);

X = [DatosFondo; DatosColor];
Y = [zeros(size(DatosFondo,1),1); ones(size(DatosColor,1),1)];


if ~exist('VariablesGeneradas', 'dir'), mkdir('VariablesGeneradas'); end
save('VariablesGeneradas/conjunto_de_datos_original.mat', 'X', 'Y');


posClaseInteres = find(unique(Y) == 1);
posOutliers = funcion_detecta_outliers_clase_interes(X, Y, posClaseInteres);

X(posOutliers, :) = [];
Y(posOutliers) = [];

if ~exist('VariablesGeneradas', 'dir'), mkdir('VariablesGeneradas'); end
save('VariablesGeneradas/conjunto_de_datos.mat', 'X', 'Y');

