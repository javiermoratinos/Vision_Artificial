I = imread('Estanteria.bmp');
%Voy a combertir a escala de grises
J = rgb2gray(I);
%Obtengo sus dimensiones
[Fil Col] = size(J);
%Sx=1.5 Sy=1.5
T=[1.5 0 0; 0 1.5 0; 0 0 1];

%Funcion para la transformada Directa
PT = zeros(Fil, Col, 'uint8');
for y=1:Fil
    for x=1:Col
        P = [x, y, 1]';
        PT = T*P;
        if(1 <= round(PT(2)) && round(PT(2)) <= Fil && 1 <= round(PT(1)) && round (PT(1)) <= Col)
            JT(round(PT(2)), round(PT(1)))= J(y,x);
        end
    end
end

%Funcion para la transformada Inversa
[Fil2 Col2] = size(JT);
for z=1:Fil2
    for w=1:Col2
        U=[w, z, 1]';
        UT = inv(T)*U;
        if(1 <= round(UT(2)) && round(UT(2)) <= Fil2 && 1 <= round(UT(1)) && round(UT(1)) <= Col2)
            UJ(round(UT(2)), round(UT(1))) = JT(z,w);
        end
    end
end

%Muestro los resultados por pantalla
subplot(3,1,1),imshow(I), title('Original');
subplot(3,1,2),imshow(JT), title('Transformada Directa');
subplot(3,1,3),imshow(UJ), title('Transformada Inversa');
