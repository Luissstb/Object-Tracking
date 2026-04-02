function representa_datos_y_esferas_espacio_ccas(XColor, XFondo, centroides_radios)
    figure; hold on;
    scatter3(XFondo(:,1), XFondo(:,2), XFondo(:,3), 5, 'r', 'filled');
    scatter3(XColor(:,1), XColor(:,2), XColor(:,3), 5, 'g', 'filled');
    
    for i = 1:size(centroides_radios, 1)
        centro = centroides_radios(i, 1:3);
        radio = centroides_radios(i, 4);
        representa_esfera(centro, radio);
    end
    
    xlabel('R'); ylabel('G'); zlabel('B');
    legend('Fondo', 'Color Seguimiento', 'Esferas Clasificador'); 
    title('Clasificador de Esferas en Espacio RGB');
    axis([0 255 0 255 0 255]); grid on; hold off;
end