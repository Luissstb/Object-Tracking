function representa_datos_color_seguimiento_fondo(XColor, XFondo)
    figure; hold on;
    scatter3(XFondo(:,1), XFondo(:,2), XFondo(:,3), 5, 'r', 'filled');
    scatter3(XColor(:,1), XColor(:,2), XColor(:,3), 5, 'g', 'filled');
    xlabel('R'); ylabel('G'); zlabel('B');
    legend('Fondo', 'Color Seguimiento'); title('Fondo y Objeto en RGB');
    axis([0 255 0 255 0 255]); grid on; hold off;
end
