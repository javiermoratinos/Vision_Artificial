img=imread('sudoku_limpia.png');

imgc=imcomplement(img);
figure(5),imshow(imgc),title 'original';
imshow(imgc)



%Contamos el nuemro de objetos
cc=bwconncomp(imgc);   
n=cc.NumObjects;
L=labelmatrix(cc);
%Calculamos la relacion ancho/alto

%Bounding Box [left,top,width,height]
estado=regionprops(cc,'all');


for i=1:n
    BB=estado(i).BoundingBox;   
    E=estado(i).EulerNumber;

    hold on
             if E==0
                rectangle('Position',[BB(1),BB(2),BB(3),BB(4)], 'EdgeColor','g');
             end 
             if E==1
                rectangle('Position',[BB(1),BB(2),BB(3),BB(4)], 'EdgeColor','g');
             end 

    hold off
end


for i=1:n
   
    BB=estado(i).BoundingBox;   
    ancho=BB(3);
    largo=BB(4);
    relacion=ancho/largo;
    
    hold on
     if relacion<0.5
        rectangle('Position',[BB(1),BB(2),BB(3),BB(4)], 'EdgeColor','r');
        
     end 
    hold off
end

