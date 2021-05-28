I=imread('llanta1.jpg');
subplot(1,3,1), imshow(I), title('Imagen original');

%Mascara para dirección x
mask_x=[-1 0 1; -2 0 2; -1 0 1]; 
%gradiente en dirección x
Gx=filter2(mask_x, Igris); 
%Mascara para dirección y
mask_y=[-1 -2 -1; 0 0 0; 1 2 1]; 
%gradiente en dirección y
Gy=filter2(mask_y,Igris); 
%muestro el resultado
subplot(1,3,2), imshow(Gx, [-128, 128]), title('Componentes horizontales del gradiente');
subplot(1,3,3), imshow(Gy, [-128, 128]), title('Componentes verticales del gradiente');
%Hay que sumar los módulos con su valor absotluto. Modulo = suma con su valor absoluto de los gradientes.
G = abs(Gx) + abs(Gy); 
%paso a uint8 [0,255]
Ibordes=uint8(G); 
%muestro el resultado
figure, imshow(Ibordes), title('Bordes del modulo [abs(Gx)+abs(Gy)]');
%Binarizacion
th=graythresh(Ibordes);
Gbin=im2bw(Ibordes,th);
%muestro el resultado
figure, imshow(Gbin), title('Bordes de la imagen binarizada');
