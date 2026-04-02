clear, clc, close all
addpath('../funciones');
load('../Material_Profesor/materialImplementacion.mat');

videoIn = VideoReader('../Material_Profesor/video_entrada.avi');

if ~exist('VideosGenerados', 'dir'), mkdir('VideosGenerados'); end
videoOut = VideoWriter('./VideosGenerados/resultado_43.avi');
videoOut.FrameRate = videoIn.FrameRate;
open(videoOut);

figure('Name', 'Seguimiento 4.3 - Tamaños');
tamano_video = [];

while hasFrame(videoIn)
    frame = readFrame(videoIn);
    
    Ib = calcula_deteccion_multiples_esferas_en_imagen(frame, datosMultiplesEsferas);
    Ib_limpia = bwareaopen(Ib, numPix);
    
    stats = regionprops(Ib_limpia, 'PixelList', 'Centroid', 'Area');
    
    imshow(frame); hold on;
    
    if ~isempty(stats)
        for i = 1:length(stats)
            pix = stats(i).PixelList;
            plot(pix(:,1), pix(:,2), 'c.', 'MarkerSize', 1);
        end
        
        [~, idx_sort] = sort([stats.Area], 'descend');
        
        idx1 = idx_sort(1);
        pix1 = stats(idx1).PixelList;
        c1 = stats(idx1).Centroid;
        plot(pix1(:,1), pix1(:,2), 'b.', 'MarkerSize', 1);
        rectangle('Position', [c1(1)-3.5, c1(2)-3.5, 7, 7], 'FaceColor', 'w', 'EdgeColor', 'w');
        
        if length(stats) >= 2
            idx2 = idx_sort(2);
            pix2 = stats(idx2).PixelList;
            c2 = stats(idx2).Centroid;
            plot(pix2(:,1), pix2(:,2), 'g.', 'MarkerSize', 1);
            rectangle('Position', [c2(1)-3.5, c2(2)-3.5, 7, 7], 'FaceColor', 'w', 'EdgeColor', 'w');
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