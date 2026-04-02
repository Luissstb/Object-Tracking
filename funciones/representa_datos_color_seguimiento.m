function representa_datos_color_seguimiento(XColor)
    figure;
    scatter3(XColor(:,1), XColor(:,2), XColor(:,3), 5, 'g', 'filled');
    xlabel('R'); ylabel('G'); zlabel('B');
    legend('Color de Seguimiento'); title('Datos del Objeto en RGB');
    axis([0 255 0 255 0 255]); grid on;
end