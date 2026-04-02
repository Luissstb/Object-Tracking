clear, clc, close all
addpath('../funciones');
load('../02_Extraer_Representar_Datos/VariablesGeneradas/conjunto_de_datos.mat');

XColor = X(Y == 1, :);
XFondo = X(Y == 0, :);

K = 1;
[idx, centroides] = funcion_kmeans(XColor, K);

datosMultiplesEsferas = zeros(K, 4);

for k = 1:K
    XColor_k = XColor(idx == k, :);
    datosMultiplesEsferas(k, :) = calcula_datos_esfera(XColor_k, XFondo);
end

datosMultiplesEsferas(:,4) = datosMultiplesEsferas(:,4) * 0.2;

if ~exist('VariablesGeneradas', 'dir'), mkdir('VariablesGeneradas'); end
save('./VariablesGeneradas/datos_multiples_esferas.mat', 'datosMultiplesEsferas');

representa_datos_y_esferas_espacio_ccas(XColor, XFondo, datosMultiplesEsferas);