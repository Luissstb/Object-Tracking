function funcion_visualiza(imgOriginal, imgColor, imgLimpia)
    figure('Name', 'Evaluacion de Deteccion');
    subplot(1,3,1); imshow(imgOriginal); title('1. Imagen Original');
    subplot(1,3,2); imshow(imgColor); title('2. Deteccion Clasificador');
    subplot(1,3,3); imshow(imgLimpia); title('3. Deteccion Final (Sin Ruido)');
end