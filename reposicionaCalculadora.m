function [  ] = reposicionaCalculadora(I)   
subplot(141),imshow(I),title('Imagen original');   
umbralOpt=graythresh(I); 
BW=im2bw(I,umbralOpt); 
subplot(142),imshow(BW),title('Imagen binaria');   
%rellenamos los agujeros para trabajar con un solo objeto y 
BW2=imfill(BW,'holes'); 

%Vamos a obtener: centro de gravedad, orientación y area. 
stats=regionprops(BW2,'centroid','orientation','area');   
subplot(143),imshow(BW2),title('Imagen sin agujeros');     
%situamos la calculadora en posición horizontal.   
Angulo=stats.Orientation 
if Angulo<0     
    giro=-Angulo; 
else     
    giro=-Angulo; 
end
Giro=giro*(pi/180); 
Tr = [cos(Giro) -sin(Giro) 0; sin(Giro) cos(Giro), 0; 0, 0, 1]; 
tform = maketform('affine', Tr); 
girada=imtransform(I,tform); 
subplot(144),imshow(girada),title('Imagen  girada');   
Im_calculadoragirada=bwlabel(girada,8); 
S=regionprops(Im_calculadoragirada,'BoundingBox'); 
recta=imcrop(girada,S(1).BoundingBox); 
figure,imshow(recta),title('Imagen original girada');
end  

