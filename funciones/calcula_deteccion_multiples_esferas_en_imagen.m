function Ib = calcula_deteccion_multiples_esferas_en_imagen(I, centroides_radios)
    R = double(I(:,:,1)); 
    G = double(I(:,:,2)); 
    B = double(I(:,:,3));
    
    % Inicializamos la imagen binaria a 0 (falso)
    Ib = false(size(I, 1), size(I, 2));
    
    % Recorremos todas las esferas (en tu caso, solo hay 1)
    for i = 1:size(centroides_radios, 1)
        Rc = centroides_radios(i, 1);
        Gc = centroides_radios(i, 2);
        Bc = centroides_radios(i, 3);
        Radio = centroides_radios(i, 4);
        
        % Distancia de cada píxel de la imagen al centroide de la esfera
        MD = sqrt((R - Rc).^2 + (G - Gc).^2 + (B - Bc).^2);
        
        % Si la distancia es menor que el radio, es objeto
        Ib_esfera = MD < Radio;
        
        % Unimos con lo que ya tuviéramos detectado (operación OR)
        Ib = Ib | Ib_esfera;
    end
end