I=imread('carta.jpg');
subplot(1,2,1),imshow(I),title('Original');
I=rgb2gray(I);
I=edge(I,'canny');
[H,theta,rho]=hough(I);
P = houghpeaks (H,40,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(I,theta,rho,P,'FillGap',5,'MinLength',6);
subplot(1,2,2),imshow(I),title('Lineas en la imagen'), hold on;
max_len=0;
for k= 1:length(lines)
    xy= [lines(k).point1; lines(k).point2];
    
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','blue');
    
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','green');
    
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','m');
    
        len= norm(lines(k).point1 - lines(k).point2);
        if (len > max_len)
             max_len = len;
             xy_long = xy;
        end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','yellow');


