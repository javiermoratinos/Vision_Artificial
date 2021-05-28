function [img_numeros] = numeros_sudoku(BW)
%Filtro por tamaño
BW2 = bwareafilt(BW,[200 800]); 
%Filtro por aspecto
propied=regionprops(BW2,'MajorAxisLength', 'BoundingBox')
idx=find([propied.MajorAxisLength]>70);
%Marcamos las regiones que superen la longitud establecida anteriormente
for n=1:size(idx,2)
    %rectangle('Position',propied(idx(n)).BoundingBox,'EdgeColor','r','LineWidth',2), title('Regiones marcadas');
end
%Eliminamos esas regiones que no queremos
for n=1:size(idx,2)
    %Redondeamos los parametros de nuestros rectangulos
    d=round(propied(idx(n)).BoundingBox); 
    %Anulamos los rectangulos de las regiones que no queremos 
    BW2(d(2):d(2)+d(4),d(1):d(1)+d(3))=0;  
end
%mostramos el resultado al aplicar el filtro
figure; imshow(BW2), title('Filtro por aspecto');
%Numero de regiones
cc = bwconncomp(BW2);
img_numeros = cc.NumObjects
%muestro el resultado
R=~BW2;
figure(1); subplot(1,2,2),imshow(R), title('Numeros sudoku');


