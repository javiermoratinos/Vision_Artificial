I=rgb2gray(imread('Baraja.png'));
[J,rect] = imcrop(I);
imshowpair(I,J,'montage');
c = normxcorr2(J,I);
[ypeak, xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(J,1);
xoffSet = xpeak-size(J,2);
figure, imshow(I);
imrect(gca, [xoffSet+1, yoffSet+1, size(J,2), size(J,1)]);