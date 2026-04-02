clear, clc, close all
addpath('../funciones');
load('../03_DisegnoClasificador/VariablesGeneradas/datos_multiples_esferas.mat');
load('../04_AplicacionClasificador_ImgCalib/VariablesGeneradas/umbral_conectividad.mat');

videoIn = VideoReader('../01_GeneracionMaterial/MaterialGenerado/video_entrada.avi');

if ~exist('VideosGenerados', 'dir'), mkdir('VideosGenerados'); end
videoOut = VideoWriter('./VideosGenerados/resultado_41_42.avi');
videoOut.FrameRate = videoIn.FrameRate;
open(videoOut);

figure('Name', 'Seguimiento 4.1 y 4.2');
tamano_video = [];

while hasFrame(videoIn)
    frame = readFrame(videoIn);
    
    Ib = calcula_deteccion_multiples_esferas_en_imagen(frame, datosMultiplesEsferas);
    Ib_limpia = bwareaopen(Ib, numPix);
    stats = regionprops(Ib_limpia, 'Area', 'Centroid', 'PixelList');
    
    imshow(frame); hold on;
    
    if ~isempty(stats)
        [~, idx_sort] = sort([stats.Area], 'descend');
        idx_mayor = idx_sort(1);
        
        pixeles_mayor = stats(idx_mayor).PixelList;
        plot(pixeles_mayor(:,1), pixeles_mayor(:,2), 'm.', 'MarkerSize', 1);
        
        for i = 1:length(stats)
            centro = stats(i).Centroid;
            rectangle('Position', [centro(1)-3.5, centro(2)-3.5, 7, 7], 'FaceColor', 'w', 'EdgeColor', 'w');
        end
    end
    
    hold off; drawnow;
    
    F = getframe(gcf);
    if isempty(tamano_video)
        tamano_video = [size(F.cdata, 1), size(F.cdata, 2)];
    end
    writeVideo(videoOut, imresize(F.cdata, tamano_video));
end
close(videoOut);