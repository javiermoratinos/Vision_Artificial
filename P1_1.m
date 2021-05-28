%imread sirve para leer una imagen del fichero, la imagen a leer debe 
%encontrarse en la carpeta de trabajo de Matlab, los formatos de imagen que
%soporta Matlab pueden ser: JPG, GIF, PNG, BMP, TIF, XWD
I=imread('cojinetes.bmp');
J=imread('Parrots.jpg');
K=imread('rice.png');
L=imread('cameraman.tif');
%imshow sirve para mostrar la imagen guardada anteriormente
%figure(1); %crea una nueva ventana de la figura 1
%imshow(I), title('Rodamientos'); %titulo de la figura 1
%figure(2); %crea una nueva ventana de la figura 2
%imshow(J), title('Psittacoidea'); %titulo de la figura 2
%figure(3); %crea una nueva ventana de la figura 3
%imshow(K), title ('Arroz'); %titulo de la figura 3
%figure(4); %crea una nueva ventana de la figura 4
%imshow(L), title ('Camarógrafo'); %titulo de la figura 4

%imshist muestra por pantalla el histograma de la imagen que le indiques,
%dado que de forma predeterminada es escala de grises, el histograma 
%tendra 256 bins
%figure(5);imhist(I);title('histograma rodamientos');
%figure(6);imhist(J);title('histograma loros');
%figure(7);imhist(K);title('histograma arroz');
%figure(8);imhist(L);title('histograma camarógrafo');

%rgb2gray convierte una imagen RGB (Red, Green, Blue) a una imagen en
%escala de grises.
Jgray=rgb2gray(J);  %convierte la imagen RGB a escala de grises
%subplot(n,m,p) divide una figura en varias regiones de visualización,
%mediante su sintaxis (n,m,p) se define una matriz de regiones de
%visualizacion y se especifica que region esta activa.
subplot(1,2,1),imshow(J);title('Original');
subplot(1,2,2),imshow(Jgray);title('Escala grises');


%Jhsv=rgb2hsv(J); %convierte la imagen RGB en el espacio de color HSV
%imshow(Jhsv), title ('kk') ;






