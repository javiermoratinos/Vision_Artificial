function[T]=transforma(I,A)
[fil,col]=size(I);
T=zeros(fil,col);
for f=1:fil;
    for c=1:col
        %traspuesta de las coordenadas de la transformada
        Pt=[f c 1]'; 
        Po=inv(A)*Pt; 
        %coordenadas y imagen inicial
        fini=Po(1); 
        %coordenadas x imagen inicial
        cini=Po(2);
        %compruebo que Po cae dentro de la imagen
        if(fini>=1 && fini<fil && cini>=1 && cini<col)
            %Vecino más próximo, redondeo al entero más cercano
            T(f,c)=I(round(fini),round(cini)); 
        end
    end
end
T=mat2gray(T);

