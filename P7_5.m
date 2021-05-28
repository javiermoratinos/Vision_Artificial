I=imread('botella1.bmp');
figure, subplot(1,2,1),imshow(I),title('Original');
th= graythresh(I);
BN= imbinarize(I,th);
ee= strel('disk',5);
BN= imerode(BN,ee);
Bordes= edge(BN,'Canny');
[H,T,R]= hough(Bordes);
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P=houghpeaks(H,5); %vector de coordenadas de los picos de n
x= T(P(:,2));
y= R(P(:,1));
plot(x,y,'x','color','red');

lines = houghlines(Bordes,T,R,P,'FillGap',30,'MinLength',7);
subplot(2,2,2),imshow(Bordes),title('Bordes'), hold on
max_len=0;
for k= 1:length(lines)
    xy= [lines(k).point1; lines(k).point2];
    
    len= norm(lines(k).point1 - lines(k).point2);
    
    if (len > max_len)
        max_len = len;
        xy_long = xy;
    end
end

%segmento mas largo
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','m');
plot(xy_long(1,1),xy_long(1,2),'x','LineWidth',2,'Color','yellow');
plot(xy_long(2,1),xy_long(2,2),'x','LineWidth',2,'Color','red');

[fil,col]= size(I);

Altura= fil - xy_long(1,2);
fprintf('El nivel de llenado es: %d\n',Altura);

