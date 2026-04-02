clear, clc, close all
addpath('../funciones');
load('../Material_Profesor/materialImplementacion.mat');

videoIn = VideoReader('../Material_Profesor/video_entrada.avi');

if ~exist('VideosGenerados', 'dir'), mkdir('VideosGenerados'); end
videoOut = VideoWriter('./VideosGenerados/resultado_44_45.avi');
videoOut.FrameRate = videoIn.FrameRate;
open(videoOut);

fondo_mediano = median(double(imagenes_fondo), 4);
fondo_gris = mean(fondo_mediano, 3);
ultimo_centroide = [];

figure('Name', 'Seguimiento 4.4 y 4.5 - Movimiento');
tamano_video = [];

while hasFrame(videoIn)
    frame = readFrame(videoIn);
    frame_gris = mean(double(frame), 3);
    
    diff_fondo = abs(frame_gris - fondo_gris) > 40;
    
    Ib = calcula_deteccion_multiples_esferas_en_imagen(frame, datosMultiplesEsferas);
    Ib_limpia = bwareaopen(Ib, numPix);
    stats = regionprops(Ib_limpia, 'PixelIdxList', 'Centroid', 'Area', 'PixelList');
    
    imshow(frame); hold on;
    
    agrup_movimiento = [];
    for i = 1:length(stats)
        if any(diff_fondo(stats(i).PixelIdxList))
            agrup_movimiento = [agrup_movimiento, i];
        end
    end
    
    if ~isempty(agrup_movimiento)
        if isempty(ultimo_centroide)
            areas = [stats(agrup_movimiento).Area];
            [~, idx_max_area] = max(areas);
            obj_idx = agrup_movimiento(idx_max_area);
        else
            distancias = zeros(1, length(agrup_movimiento));
            for j = 1:length(agrup_movimiento)
                c = stats(agrup_movimiento(j)).Centroid;
                distancias(j) = sqrt(sum((c - ultimo_centroide).^2));
            end
            [~, idx_min_dist] = min(distancias);
            obj_idx = agrup_movimiento(idx_min_dist);
        end
        
        ultimo_centroide = stats(obj_idx).Centroid;
        
        pixeles_obj = stats(obj_idx).PixelList;
        plot(pixeles_obj(:,1), pixeles_obj(:,2), 'y.', 'MarkerSize', 1);
        rectangle('Position', [ultimo_centroide(1)-3.5, ultimo_centroide(2)-3.5, 7, 7], 'FaceColor', 'w', 'EdgeColor', 'w');
    end
    
    hold off; drawnow;
    
    F = getframe(gcf);
    if isempty(tamano_video)
        tamano_video = [size(F.cdata, 1), size(F.cdata, 2)];
    end
    writeVideo(videoOut, imresize(F.cdata, tamano_video));
end
close(videoOut);