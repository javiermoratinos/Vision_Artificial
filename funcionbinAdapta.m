function [Isal]=binAdapta(Ient,tamVentana)
Int=integralImage(Ient);
[fil,col]=size(Ient);
Isal=zeros(fil, col);
for i = 2:fil 
   for j = 2:col
        %ventana cuadrada
        i1 = i - tamVentana/2;
        i2 = i + tamVentana/2;
        j1 = j - tamVentana/2;
        j2 = j + tamVentana/2;
        %bordes
        if i1<2 i1=2;        end
        if j1<2 j1=2;        end
        if i2>fil   i2=fil;  end
        if j2>col  j2=col;   end
        %numero pix en la ventana
        n = (i2 - i1) * (j2 - j1);
        suma = Int(i2,j2)-Int(i2,j1)-Int(i1,j2)+Int(i1,j1);
        mediaVentana=suma/n;
        if Ient(i,j) > 0.9*mediaVentana 
            Isal(i,j)=255;
        else
            Isal(i,j)=0;
        end
   end
end
imshow(Isal) 

