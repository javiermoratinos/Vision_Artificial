I=imread('cuadradas-redondas.jpg')
th=graythresh(I);
BW=~im2bw(I,th);
ee=strel('disk',25);
I1=imfill(BW,'holes');
I2=imerode(I1,ee)
cc=bwconncomp(I2);
stats=regionprops(cc,'all');
num=cc.NumObjects;
imshow(I2);
hold on;
for i=1:num
    Caja=stats(i).BoundingBox;
    pos=stats(i).Centroid;
    text(Caja(1)+Caja(3),Caja(2)+Caja(4),int2str(i),'Color','red','FontSize',15);
    if stats(i).Eccentricity<0.5
        fprintf('Galleta  %0.f redonda\n',i);
        text(pos(1)-100,pos(2),'Redonda','color','green');
    else
        fprintf('Galleta %0.f cuadrada\n',i);
        text(pos(1)-100,pos(2),'Cuadrada','color','blue');
    end
end
hold off;

