function [X,Y] = coordPixelsCont( C )
%Devuelve dos vectores con las x(colum) y las y(filas)
%de los pixels activos que hay en la imagen binaria C
%Si no encuentra nada devuelve
%    X(1)=-1;
%    Y(1)=-1;
% Se podría hacer [Y,X] = find(C);

[filas,columnas]=size(C);
numPixelsCont=0;
for i=1:filas
    for j=1:columnas
        if C(i,j)==0
            continue;
        else
            numPixelsCont = numPixelsCont + 1;
            X(numPixelsCont) = j; %coord x
            Y(numPixelsCont) = i; %coord y
        end
    end
end
if numPixelsCont==0 %Si no encuentra nada devuelve -1
    X(1)=-1;
    Y(1)=-1;
end
end



