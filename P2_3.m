%Leer imagen original y mostrarla
I=imread('cartel.jpg');
imshow(I);
%Coord imagen de 4 puntos (coplanarios)
fprintf('Seleccionar 4 esquinas, en sentido horario\n');
[X Y] = ginput(4);
% Coord deseadas de los 4 puntos 
% (En unidades de pixel, para una mejor visualización)
x=[1;400;400;1];
y=[1;1;350;350]; 
T=invierteHomografia(X, Y, x, y) 
% Resultado homografía inversa
corregida=imtransform(I,T, 'XData',[x(1) x(2)],'YData',[y(1) y(4)]);
% Imagen global
corregida_global=imtransform(I,T);
subplot(1,3,1),imshow(I), title('Original');
subplot(1,3,2),imshow(corregida), title('Homografia inversa');
subplot(1,3,3),imshow(corregida_global), title('Imagen global');

