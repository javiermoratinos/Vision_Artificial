X=imread('circuit.jpg');
I=rgb2gray(X);
J=fspecial('log');
A=imfilter(I,J);

%muestro el resultado
subplot(1,2,1),imshow(I),title('original');
subplot(1,2,2),imshow(A),title('Laplaciana gaussiana "fspecial"');

B=edge(I,'log');
C=edge(I,'log',0.008);
D=edge(I,'log',0.008,1);

%muestro el resultado
figure;
subplot(2,2,1),imshow(I),title('original');
subplot(2,2,2),imshow(B),title('Laplaciana gaussiana "edge"');
subplot(2,2,3),imshow(C),title('Laplaciana gaussiana "umbral 0.008"');
subplot(2,2,4),imshow(D),title('Laplaciana gaussiana "umbral 0.008 sigma 1"');