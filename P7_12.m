%Lee imagen, binariza, invierte
I=imread('parllaves2.jpg');
G=rgb2gray(I);
th=graythresh(I);
BW=im2bw(I, th);
BW=~BW;
%Elimina pequeñas regiones y rellena los agujeros
BWE=bwareaopen(BW, 50000, 4);
F=imfill(BWE, 'holes');
%Deteccion y muestra de componentes conexas
imshow(F);
cc=bwconncomp(F, 4);
L=labelmatrix(cc);
fprintf('Se han encontrado %d componentes conexas', cc.NumObjects);
imshow(label2rgb(L, 'jet', 'k'));
%Agrandamos la imagen, para evitar que la llave se salga cuando la giremos
cols_para_giro=500;
L=padarray(L, [0 cols_para_giro], 0, 'post');

%Lleva cada objeto a una imagen distinta y las coloca en la misma posicion
%para poder restar una de otra
I1=(L==1);
    cc=bwconncomp(I1,8);
    st=regionprops(cc, 'all');
    ang=st.Orientation;
    st.Centroid;
    v=[0.5*size(I1,1)-st.Centroid(1),0.5*size(I1,2)-st.Centroid(2)];
    I1=imtranslate(I1,v);
    I1=imrotate(I1,-ang);
I2=(L==2);
    cc=bwconncomp(I2,8);
    st=regionprops(cc, 'all');
    ang=st.Orientation;
    I2=imrotate(I2,-ang);
    I2=imcrop(I2,[0 0 size(I1,2) size(I1,1)]);
    cc=bwconncomp(I2,8);
    st=regionprops(cc, 'all');
    st.Centroid;
    v=[0.5*size(I2,1)-st.Centroid(1),0.5*size(I2,2)-st.Centroid(2)];
    I2=imtranslate(I2,v);
    
    figure, subplot(1,2,1), imshow(I1), subplot(1,2,2), imshow(I2);
    bwarea(I1-I2)
    figure, imshow(I1-I2);