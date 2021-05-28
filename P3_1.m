I=imread('flores.jpg');
Ispeckle1=imnoise(I, 'speckle', 0.05);
Ispeckle2=imnoise(I, 'speckle', 0.15);
Ispeckle3=imnoise(I, 'speckle', 0.5);
%muestro el resultado
subplot(1,4,1), imshow(I), title('Imagen original');
subplot(1,4,2), imshow(Ispeckle1), title('Ruido speckle 0.05');
subplot(1,4,3), imshow(Ispeckle2), title('Ruido speckle 0.15');
subplot(1,4,4), imshow(Ispeckle3), title('Ruido speckle 0.5');
