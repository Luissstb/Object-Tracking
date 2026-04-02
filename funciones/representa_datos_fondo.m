function representa_datos_fondo(XFondo)
    figure;
    scatter3(XFondo(:,1), XFondo(:,2), XFondo(:,3), 5, 'r', 'filled');
    xlabel('R'); ylabel('G'); zlabel('B');
    legend('Fondo de la escena'); title('Datos del Fondo en RGB');
    axis([0 255 0 255 0 255]); grid on;
end

