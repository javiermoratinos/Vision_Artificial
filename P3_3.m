I=imread('calculadora0.png')
J=imnoise(I,'gaussian');
K=imnoise(I,'salt & pepper');
L=imnoise(I,'speckle');

MIN= ordfilt2(J,5,ones(3,3));
MAX= ordfilt2(J,9,ones(3,3));
MED= ordfilt2(J,1,ones(3,3));

MIN2= ordfilt2(K,5,ones(3,3));
MAX2= ordfilt2(K,9,ones(3,3));
MED2= ordfilt2(K,1,ones(3,3));

MIN3= ordfilt2(L,5,ones(3,3));
MAX3= ordfilt2(L,9,ones(3,3));
MED3= ordfilt2(L,1,ones(3,3));

%muestro el resultado
subplot(2,2,1),imshow(L),title('Original');
subplot(2,2,2),imshow(MED3),title('Filtro mediana');
subplot(2,2,3),imshow(MIN3),title('Filtro minimo');
subplot(2,2,4),imshow(MAX3),title('Filtro maximo');