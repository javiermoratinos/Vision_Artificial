I=imread('chaveta01.png');
Cont=edge(I);
imshow(Cont);
hold on;
[X,Y] = coordPixelsCont(Cont);   %coord punt.contorno a vectores X e Y
[xInliers,yInliers] = ransacCircR( X,Y, 120); %busco circ con radio 120
[A,B,C]=LMSCirc(xInliers,yInliers);   %ajuste de los inliers por min.cuadrados
dibujaCircABC(A,B,C, 'r');