function F = numeros_sudoku(I)
%I=Imagen binarizada, fondo negro

%Extraccion lineas verticales
elv=strel('line',25,90);
cuadriculavertical=imerode(I,elv);
%Extraccion lineas horizontales
elh=strel('line',25,0);
cuadriculahorizontal=imerode(I,elh);

%Cuadricula
cuadricula=cuadriculavertical+cuadriculahorizontal;
imshow(cuadricula),title 'cuadricula'
%Eliminar cuadricula
numeros=imsubtract(I,cuadricula);
figure,imshow(numeros),title 'Numeros'

%Eliminar pequenas regiones
epr = strel('disk',2);
Ilimpia=imopen(numeros,epr);
epr = strel('disk',3);
Ifinal=imclose(Ilimpia,epr);
figure,imshow(Ilimpia)

%Invertir la imagen de nuevo
Iinvertida2=imcomplement(Ifinal );
imshow(Iinvertida2)
end

