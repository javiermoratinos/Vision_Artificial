function[T]=dimensiones(I)
[fil,col]=size(I);
cont_largo=0;
largo=0;
ancho=0;
cont_ancho=0;
for x=1:col
for y=1:fil
    if(I(y,x))
        cont_ancho=cont_ancho+1;
    end
end
if(cont_ancho>ancho)
    ancho=cont_ancho;
end
cont_ancho=0;
end
ancho
for x=1:fil
for y=1:col
    if(I(x,y))
        cont_largo=cont_largo+1;
    end
end
if(cont_largo>largo)
    largo=cont_largo;
end
cont_largo=0;
end
largo
end
