I1 = rgb2gray(imread('cereales_1.jpg'));
I2 = rgb2gray(imread('cereales_2.jpg'));

points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);

[f1,vpts1] = extractFeatures(I1,points1);
[f2,vpts2] = extractFeatures(I2,points2);
 
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));
 
%Los vectores matchedPoints1 y 2 tienen los puntos homólogos de I1 I2 que
%se pueden visualizar sus coordenadas usando comandos como 'montage' 'falsecolor'
%muestro el resultado
figure; 
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2, 'montage');
legend('matched points 1','matched points 2');
