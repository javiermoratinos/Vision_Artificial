function [xInliers,yInliers]=ransacCircR( xPixelsCont, yPixelsCont, radioBuscado )
% RANSAC Circ que finaliza cuando alcanza un num.  superior a numMinInliers
% xPixelsCont,yPixelsCont contiene las x  (columnas)y las y (filas) de los
% pix de cont
% radioBuscado Radio que tiene la circ buscada +- tolerRadio
% xInliers son las columnas de los inliers
% yInliers son las filas de los inliers
% xInliers e yInliers hay que pasarlos LMS para calcular circunferencia
% con mejor precisión
% Ojo hay parametros que se ajustan dentro de la funcion para cada problema
% concreto: tolerInliers, numMinInliers y tolerRadio. Ver descrip abajo
% -------------------------- EJECUCION---------------------------------
% Cont=edge(I);
% [X,Y] = coordPixelsCont(Cont);   %coord punt.contorno a vectores X e Y
% [xInliers,yInliers] = ransacCircR( X,Y, 120); %busco circ con radio 120
% [A,B,C]=LMSCirc(xInliers,yInliers);   %ajuste de los inliers por min.cuadrados
% dibujaCircABC(A,B,C, 'r');
% ---------------------------------------------------------------------

tolerInlier=2; %es inlier si está a 2 pixeles de la circunf hipótesis
numMinInliers = 500; %itera hasta encontrar al menos numMinInliers
tolerRadio = 20; %permitimos una desviación en el radio de hasta +-20 pix
radioMax = radioBuscado + tolerRadio;
radioMin = radioBuscado - tolerRadio;

numIteraciones=0;
numInliers=0;
while(numInliers<numMinInliers)
    numIteraciones=numIteraciones+1;
    [xSample,ySample]=eligePuntosRand(xPixelsCont,yPixelsCont,3);
    %circunf que pasa por estos tres puntos
    [A, B, C] = LMSCirc(xSample,ySample);
    centro= [-A/2,-B/2];
    radio= sqrt(A^2+B^2-4*C)/2;
    
    %solo si la circunf hipotesis tiene es del radio que buscamos 
    %calculamos el numero de inliers
    if (radio < radioMax) && (radio > radioMin)
        [xInliers,yInliers] = InliersCirc( xPixelsCont,yPixelsCont,centro,radio, tolerInlier);
        numInliers=length(xInliers);
    end
end

fprintf('Encontrados %d inliers en %d iteraciones\n',numInliers,numIteraciones);
end

