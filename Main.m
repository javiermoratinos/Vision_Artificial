%La linea 6 la podriamos suprimir y una vez ejecutamos el programa 
%podriamos leer la imagen directamente desde Command Window, ejemplo:
%      >>I=imread('pastillas.jpg')
%      >>planos_RGB(I)
%      >>planos_HSV(I)
I=imread('caramelos.jpg');
planos_RGB(I);
planos_HSV(I);
