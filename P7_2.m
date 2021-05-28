I = imread('arandelas_tuercas3.bmp');
imshow(I), title('Imagen original');
if(ndims(I) == 3)    
    I = rgb2gray(I);    
end
BW = im2bw(I,graythresh(I));
BWI = ~BW;
I1 = imfill(BWI,'holes');
ee = strel('diamond',5);
I2 = imerode(I1,ee);
cc = bwconncomp(I2);
num = cc.NumObjects;
L = labelmatrix(cc);
fprintf(['El número de objetos es de: ', num2str(num)]);
estado = regionprops(cc,'Area','Centroid',"Eccentricity",'Perimeter');
figure(1), imshow(I);
hold on;
for i = 1:num     
     C = estado(i).Centroid;
     plot(C(1),C(2),'-+b');     
end
hold off;
subplot(1,3,1), imshow(I), title('Tuercas');
s = find([estado.Area]>300);
hold on;
for num = 1:size(s,2)  
    text(estado(s(num)).Centroid(:,1), estado(s(num)).Centroid(:,2), 'Tuerca','color','b');    
end
hold off;
fprintf('\nNúmero de tuercas: %0.f\n',size(s,2));
subplot(1,3,2), imshow(I), title('Arandelas');
s = find([estado.Area]<300);
hold on;
for num = 1:size(s,2)  
    text(estado(s(num)).Centroid(:,1), estado(s(num)).Centroid(:,2), 'Arandela','color','r');  
end
hold off;
fprintf('Número de arandelas: %0.f\n',size(s,2));


