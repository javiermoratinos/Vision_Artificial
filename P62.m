I=imread('sudoku_bin.png');
%Invertimos la imagen
BW = ~I; 
%muestro el resultado
figure(1); subplot(1,2,1), imshow(I), title('Original');
%Llamo a la funcion numeros_sudoku
img_numeros = numeros_sudoku(BW); 
fprintf("Objetos en la imagen: %d\n",img_numeros);