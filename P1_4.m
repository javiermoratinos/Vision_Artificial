I=imread('deportivo5.jpg')
%Variables valor maximo y minimo del histograma
M=input('\nValor maximo: '); %Voy a dar por pantalla M=175
m=input('\nValor minimo: '); %Voy a dar por pantalla m=90
%Denominador ecuacion del factor de estiramiento
Resta=M-m;
Factor_estiramiento=255/Resta;
%Codigo imagen deslizada
J=I-m;
%Imagen deslizada y estirada
R=(I-m)*Factor_estiramiento;
%Imagen Original
subplot(4,2,1), imshow(I),title('Original');
subplot(4,2,2), imhist(I),title('Histograma Original');
%Imagen deslizada
subplot(4,2,3), imshow(J),title('Imagen Deslizada');
subplot(4,2,4), imhist(J),title('Histograma Imagen Deslizada');
%Imagen deslizada y estirada
subplot(4,2,5), imshow(R),title('Imagen Deslizada y Estirada');
subplot(4,2,6), imhist(R),title('Histograma Imagen Deslizada y Estirada');
