function [numObjetos] = separaObjetos( BW, radio, conectividad)
%Para la separaci�n de objetos en primer lugar realizamos una erosi�n para separar posibles uniones
 
% Erosi�n:
ee=strel('disk',radio,conectividad);
B=imerode(BW,ee);
 
%muestro el resultado
figure,imshow(B), title('Imagen erosionada');
 
cc=bwconncomp(B);
numObjetos=cc.NumObjects;
disp('El numero total de objetos en la imagen es:')
disp(numObjetos)
