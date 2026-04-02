function representa_datos_color_seguimiento_por_agrupacion(XColor, idx, K)
    figure; hold on;
    colores = lines(K);
    for k = 1:K
        muestras = XColor(idx == k, :);
        scatter3(muestras(:,1), muestras(:,2), muestras(:,3), 5, colores(k,:), 'filled');
    end
    xlabel('R'); ylabel('G'); zlabel('B');
    title('Agrupaciones K-Means');
    axis([0 255 0 255 0 255]); grid on; hold off;
end