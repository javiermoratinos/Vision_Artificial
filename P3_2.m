I=imread('flores.jpg');
Filtro1= fspecial('average',3);
Filtro2= fspecial('gaussian',2,3);
J=imnoise(I,'salt & pepper');
K=imfilter(J,Filtro1,'conv');
L=imfilter(J,Filtro2,'conv');
%muestro el resultado
subplot(1,3,1), imshow(J),title('Ruido Sal y Pimienta');
subplot(1,3,2), imshow(K),title('Filtro media');
subplot(1,3,3), imshow(L),title('Filtro gaussiano');