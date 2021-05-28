I=imread('tirafondos0.png');
if ndims(I) == 3
disp('Imagen a color')
I=rgb2gray(I);
else
disp('Imagen en escala de grises')
I=I;
end 
%pedir radio, conectividad:
conectividad=input('Elegir un entorno de 4 u 8 conectados\n');
radio=input('Dame un radio de accion\n'); 
%binarizacion
th=graythresh(I); 
BW = imbinarize(I,th);
BW1=~BW;
%muestro el resultado
figure,imshow(BW1), title('Imagen binarizada sin separar regiones');
 
Label=bwlabel(BW1,conectividad);
total_objetos=max(max(Label));
disp('El numero total de objetos en la imagen es:')
disp(total_objetos) 
%aplico la función.
elementos=separaObjetos(BW1,radio,conectividad);
