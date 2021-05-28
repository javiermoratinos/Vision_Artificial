I=imread('pelotas.jpg');
imshow(I);
[centers, radio, metric]= imfindcircles(I,[10 10000],'ObjectPolarity','dark');
hold on
viscircles(centers,radio,'EdgeColor','b');
plot (centers(:,1),centers(:,2),'x','LineWidth',3,'Color','green')
hold off