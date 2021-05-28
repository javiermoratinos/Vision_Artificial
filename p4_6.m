I=imread('perritos.jpg'); 
A=edge(I,'canny',0.08,1);
%muestro el resultado
subplot(1,2,1), imshow(I), title('Original');
subplot(1,2,2), imshow(A), title('sigma=1, threshold=0.08:');

J=imnoise(I,'Gaussian');
K=imnoise(I,'Salt & pepper');
B=edge(J,'canny',0.2,1);
C=edge(K,'canny',0.2,1);
%muestro el resultado
figure;
subplot(1,2,1), imshow(B), title('Con ruido gaussiano');
subplot(1,2,2), imshow(C), title('Con rudio sal y pimienta');