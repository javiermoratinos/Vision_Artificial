I=imread('caja.bmp');
%Invertir una imagen en escala de grises
Im1 = 255-I;
%Binarizar una imagen en escala de grises
Im2=I>100;
%Voy a invertir una imagen binarizada
Im3= ~Im2;
%muestro las imagenes mediante subplot que la divide en 4
figure(1);
subplot(2,2,1),imshow(I), title('Original');
subplot(2,2,2),imshow(Im1), title('Invertida foto escala de grises');
subplot(2,2,3),imshow(Im2), title('Binarizada');
subplot(2,2,4),imshow(Im3), title('Invertida foto binarizada');
%leo la segunda imagen
J=imread('toysflash.png');
%Voy a subirle el brillo a la imagen para que parezca que se ha tomado con
%el flash puesto
Jflash=J*1.3;

%muestro las imagenes mediante subplot que la divide en 2
figure(2);
subplot(1,2,1),imshow(J),title('Foto Original (sin flash)');
subplot(1,2,2),imshow(Jflash),title('Foto Modificada (con flash)');



