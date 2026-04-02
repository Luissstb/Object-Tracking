function datosEsfera = calcula_datos_esfera(XColor, XFondo)
    % 1. Centroide de la nube de puntos del color de seguimiento
    centro = mean(XColor, 1);
    
    % 2 y 3. Calcular r1 (distancia máxima al objeto)
    distColor = sqrt(sum((XColor - centro).^2, 2));
    r1 = max(distColor);
    
    % Calcular r2 (distancia mínima al fondo)
    distFondo = sqrt(sum((XFondo - centro).^2, 2));
    r2 = min(distFondo);
    
    % 4. Calcular el radio de compromiso r12
    r12 = (r1 + r2) / 2;
    
    % 5. Devolver vector fila [Rc, Gc, Bc, r12]
    datosEsfera = [centro(1), centro(2), centro(3), r12];
end