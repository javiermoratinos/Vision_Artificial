I=imread('calculadora3.png');
if ndims(I) == 3
disp('Imagen a color')
figure, imshow(I), title('Imagen Original');
I=rgb2gray(I);
else
disp('Imagen en escala de grises')
I=I;
figure, imshow(I), title('Imagen Original');
end
%llamada a la funcion reposicionaCalculadora
reposicionaCalculadora(I);

