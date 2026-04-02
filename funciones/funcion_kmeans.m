function [idx, centros] = funcion_kmeans(muestras, k)
    % Usamos la función nativa de MATLAB para encontrar los k centros
    [idx, centros] = kmeans(muestras, k, 'Replicates', 5);
end