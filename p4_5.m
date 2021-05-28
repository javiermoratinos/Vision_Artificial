I=imread('llave.jpg');
J=rgb2gray(I);
A=edge(J,'Sobel');
B=edge(J,'Sobel',0.04);
C=edge(J,'Sobel',0.04, 'Horizontal');
D=edge(J,'Sobel',0.04, 'Vertical');
E=edge(J,'Sobel','nothinning');
F=edge(J,'Canny');
%muestro el resultado
subplot(1,3,1),imshow(I),title('Original');
subplot(1,3,2),imshow(A),title('Filtro de Sobel');
subplot(1,3,3),imshow(B),title('Umbral 0.04');
%muestro el resultado
figure;
subplot(1,3,1),imshow(C),title('Bordes horizontales');
subplot(1,3,2),imshow(D),title('Bordes verticales');
subplot(1,3,3),imshow(E),title('Sin adelgazamiento de bordes');
%muestro el resultado
figure;
subplot(1,2,1),imshow(A),title('Filtro Sobel');
subplot(1,2,2),imshow(F),title('Filtro Canny');
