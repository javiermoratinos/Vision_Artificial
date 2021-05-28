I=imread('colors.jpg');
J=createMask(I);
%muestro el resultado
subplot(1,2,1), imshow(I), title ("Imagen original");
subplot(1,2,2), imshow(J), title ("Imagen binarizada");