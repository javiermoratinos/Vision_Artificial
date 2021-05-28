function planos_RGB(I)
    K=rgb2gray(I);
    [R,G,B]=imsplit(I);
    figure(1);
    subplot(3,2,1),imshow(I),title('Original'); 
    subplot(3,2,2),imshow(R), title ('Plano Red'); 
    subplot(3,2,3),imshow(G), title ('Plano Green'); 
    subplot(3,2,4),imshow(B), title ('Plano Blue'); 
    subplot(3,2,5),imshow(K),title('Escala de grises');
end

