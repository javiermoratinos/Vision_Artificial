I=imread('perritos.jpg');
subplot(2,2,1),imshow(I), title('Imagen original');
%Calculo del umbral automatico
th=graythresh(I); 
%Binarizacion
BW=im2bw(I,th); 
%muestro el resultado
subplot(2,2,2), imshow(BW), title('Imagen binarizada automaticamente ');
%Calculo del umbral
th1=graythresh(I); 
%factor de correción multiplicativo
th1=1.2*th1; 
%Binarizacion
BW=im2bw(I,th1); 
%muestro el resultado
subplot(2,2,3), imshow(BW), title(['Imagen binarizada a ', num2str(th1)]);
%Calculo del umbral
th2=graythresh(I); 
%factor de correción multiplicativo
th2=0.6*th2;
%Binarizacion
BW=im2bw(I,th2); 
%muestro el resultado
subplot(2,2,4), imshow(BW), title(['Imagen binarizada a ', num2str(th2)]);
