I=imread('textoMalaLuz.bmp');
tamanoventana=round(col/8)
J=binAdapta(I,tamanoventana);
%muestro el resultado
subplot(1,2,1),imshow(I),title('original');
subplot(1,2,2),imshow(J),title('binarizada');


