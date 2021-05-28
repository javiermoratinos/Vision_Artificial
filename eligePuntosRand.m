function [xSample,ySample]=eligePuntosRand( xPixelsCont,yPixelsCont,N)

% Elige N puntos aleatoriamente del conjunto (xPixelsCont,yPixelsCont)
% Devuelve dos vectores: xSample con las coord x y ySample con las coord y
xSample=zeros(N,1);
ySample=zeros(N,1);
numPixelsCont=length(xPixelsCont);
% N numero de puntos aleatorios
for k=1:N
    indexRand=floor(numPixelsCont*rand())+1;
    xSample(k)=xPixelsCont(indexRand);
    ySample(k)=yPixelsCont(indexRand);
end

end


    

