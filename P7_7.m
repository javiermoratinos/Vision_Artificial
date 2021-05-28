%Lee imagen, ajusta los puntos con RANSAC y refina el resultado por l.s.q.
I=imread('chaveta03.png');
Cont = edge(I);
[X,Y] = coordPixelsCont(Cont);          %coord punt.contorno a vectores X e Y
[xInliers,yInliers] = ransacCircR(X, Y, 120); %120 es el radio circunf buscada
[A,B,C] = LMSCirc(xInliers,yInliers);   %ajusta los inliers por min.cuadrados

%visualiza el resultado
imshow(Cont);
hold on;
dibujaCircABC( A, B, C, 'r');
