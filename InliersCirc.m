function [xInliers,yInliers] = InliersCirc( x,y,centro,radio, tolerancia)
% Calcula los inliers en una circunferencia con centro y radio que hay en
% el conjunto de píxeles con coord x e y (vectores con coord x y coord y)
% C es la imagen de contornos.
% Hasta 10.000 inliers por preasignacion de memoria

numInliers=0;
%franja de consenso (R1,R2)
R1=radio-tolerancia;
R2=radio+tolerancia;
numPixelsCont=length(x);

%preasignacion para mayor rapidez
xInliers=zeros(1,10000);  %hasta 10.000 inliers
yInliers=zeros(1,10000);

for k=1:numPixelsCont
    distCentro = sqrt((x(k)-centro(1))^2 + (y(k)-centro(2))^2);
    % Si el pixel entra dentro de la franja de consenso(R1,R2)
    if (  (distCentro > R1) && (distCentro<R2)  )
        numInliers = numInliers + 1;
        xInliers(numInliers) = x(k);
        yInliers(numInliers) = y(k);
    end
end
%Devuelve dos vectores con longitud numInliers
%(si numInliers es cero tambien funciona)
xInliers = xInliers(1:numInliers);
yInliers = yInliers(1:numInliers);

end

