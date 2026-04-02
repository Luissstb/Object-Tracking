
addpath("./funciones");


clear, clc, close all
imaqreset;


video = videoinput('linuxvideo', 1, 'YUY2_320x240');

%video = videoinput('winvideo', 1, 'YUY2_320x240');


video.ReturnedColorSpace = 'rgb'; 
video.TriggerRepeat = inf;
set(video, 'LoggingMode', 'memory'); 

fpsTrabajo = 7; 
duracionGrabacion = 20; 
numFramesGrabacion = duracionGrabacion * fpsTrabajo;


if ~exist('01_Generacion Material', 'dir')
    mkdir('01_Generacion Material'); 
end

nombre = 'video_entrada.avi';
rutaArchivo = ['./01_Generacion Material/' nombre];


aviobjOut = VideoWriter(rutaArchivo, 'Uncompressed AVI');
aviobjOut.FrameRate = fpsTrabajo;

preview(video);
fprintf('--- PREPARACIÓN ---\n');
fprintf('Use la ventana de preview para encuadrar.\n');
fprintf('Pulsa una tecla en la terminal de MATLAB para empezar a grabar...\n');
pause;

open(aviobjOut);
start(video);


for i = 1:numFramesGrabacion
    tic;
    
    frame = getsnapshot(video); 
    writeVideo(aviobjOut, frame);
    
    if i == 15, fondo1 = frame; end
    if i == 30, fondo2 = frame; end
    if i == 70, objPos1 = frame; end
    if i == 105, objPos2 = frame; end
    if i == numFramesGrabacion, imgAlejada = frame; end
    
    segundoActual = i / fpsTrabajo;
    
    if mod(i, fpsTrabajo) == 0 || i == 1
        clc; 
        fprintf('TIEMPO: %.1f seg / 20.0 seg\n', segundoActual);
        
        if segundoActual <= 5
            fprintf('ESTADO: GRABANDO FONDO (¡No enseñes el objeto!)\n');
        elseif segundoActual > 5 && segundoActual <= 17
            fprintf('ESTADO: MOVIENDO OBJETO (Muévelo por el centro)\n');
        else
            fprintf('ESTADO: POSICIÓN ALEJADA (Lleva el objeto al fondo)\n');
        end
    end
    
    pausa = (1/fpsTrabajo) - toc;
    if pausa > 0
        pause(pausa); 
    end
end

stop(video);
close(aviobjOut);
stoppreview(video);
delete(video);

save('./01_Generacion Material/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat', ...
     'fondo1', 'fondo2', 'objPos1', 'objPos2', 'imgAlejada');

clc;
fprintf('--- PROCESO FINALIZADO ---\n');
fprintf('Video guardado en: %s\n', rutaArchivo);
fprintf('Capturas guardadas en: ImagenesEntrenamiento_Calibracion.mat\n');


rutaVideo = './01_Generacion Material/MaterialGenerado/video_entrada.avi';

implay(rutaVideo);

load('./01_Generacion Material/MaterialGenerado/ImagenesEntrenamiento_Calibracion.mat');


figure('Name', 'Revision de Capturas para Calibracion');


subplot(2,3,1); imshow(fondo1); title('Fondo 1');


subplot(2,3,2); imshow(fondo2); title('Fondo 2');


subplot(2,3,4); imshow(objPos1); title('Objeto Posicion 1');


subplot(2,3,5); imshow(objPos2); title('Objeto Posicion 2');


subplot(2,3,6); imshow(imgAlejada); title('Posicion mas Alejada');



rmpath("./funciones");