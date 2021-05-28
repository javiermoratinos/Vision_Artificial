

function dibujaCircABC(A,B,C, color)

%para sobreimpresionar, la imagen tiene que ser visualizada previamente con imshow(I); hold on;


radio= sqrt(A^2+B^2-4*C)/2;
centro= [-A/2,-B/2];
dibujaCirc(centro,radio, color)


    