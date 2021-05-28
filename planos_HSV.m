function planos_HSV(I)
    %El codigo es muy parecido al de la primera funcion la unica diferencia
    %es que en lugar de convertir la imagen RGB a escala grises por la
    %funcion rgb2gray, lo convertimos directamente a HSV mediante la
    %funcion rgb2hsv
    K=rgb2hsv(I);
    [H,S,V]=imsplit(K);
    figure(2);
    subplot(3,2,1),imshow(I),title('Original');
    subplot(3,2,2),imshow(K),title('HSV'); 
    subplot(3,2,3),imshow(H),title('Plano H');
    subplot(3,2,4),imshow(S), title ('Plano S'); 
    subplot(3,2,5),imshow(V), title ('Plano V');   
end
