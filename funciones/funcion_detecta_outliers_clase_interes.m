function posOutliers = funcion_detecta_outliers_clase_interes(X, Y, posClaseInteres)
    % Identificar la clase de interés (el objeto, normalmente etiqueta 1)
    valoresY = unique(Y);
    claseInteres = valoresY(posClaseInteres);
    
    % Índices de las muestras que pertenecen al objeto
    idxClase = find(Y == claseInteres);
    muestras = X(idxClase, :);
    
    R = muestras(:,1); G = muestras(:,2); B = muestras(:,3);
    
    % --- CRITERIO 1: Componente Roja (Rango Intercuartílico) ---
    Q1 = prctile(R, 25); Q3 = prctile(R, 75);
    RI = Q3 - Q1;
    outR = (R < (Q1 - 1.5*RI)) | (R > (Q3 + 1.5*RI)); 
    
    % --- CRITERIO 2: Componente Verde (Media y Desviación) ---
    muG = mean(G); sigmaG = std(G);
    outG = (G < (muG - 2.5*sigmaG)) | (G > (muG + 2.5*sigmaG)); 
    
    % --- CRITERIO 3: Componente Azul (Límite inferior) ---
    muB = mean(B); sigmaB = std(B);
    outB = (B < (muB - 3*sigmaB)); 
    
    % Se marca como outlier si falla cualquiera de los 3 criterios
    esOutlierRelativo = outR | outG | outB;
    
    % Devolver posiciones absolutas en la matriz original X
    posOutliers = idxClase(esOutlierRelativo); 
end