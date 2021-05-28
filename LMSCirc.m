
function [A,B,C]=LMSCirc(x,y)
%minimos cuadrados circunferencia
% Devuelve los parametros A,B,C de la circunferencia x2+y2+Ax+By+C=0
%que ajusta los puntos con las coord en los vectores x,y
%Ejemplo ejecución:
% I=imread('chaveta01.png');
% imshow(I);
% J=imfill(I,'holes');
% C=edge(J);
% imshow(C);
% [Y,X] = find(C);
% [A,B,C]=LMSCirc(X,Y);
% hold on;
% dibujaCircABC(A,B,C, 'r');


suma_x = 0;
suma_x2 = 0;
suma_y = 0;
suma_y2 = 0;
suma_x_x2_y2 =0;
suma_y_x2_y2 = 0;
suma_x2_y2 = 0;
suma_xy = 0;

n=length(x);
for k=1:n
    suma_x=suma_x + x(k);
    x2 = x(k)*x(k);
    suma_x2 = suma_x2 + x2;
    suma_y = suma_y + y(k);
    y2 = y(k)*y(k);
    suma_y2 = suma_y2 + y2;
    s_x2_y2 = x2 + y2;
    suma_x_x2_y2 = suma_x_x2_y2 + x(k)*s_x2_y2;
    suma_y_x2_y2 = suma_y_x2_y2 + y(k)*s_x2_y2;
    suma_x2_y2 = suma_x2_y2 + s_x2_y2;
    suma_xy = suma_xy + x(k)*y(k);
end

M1=zeros(3);
M1(1,1)=  suma_x2;
M1(1,2)=  suma_xy;
M1(1,3)=  suma_x;
M1(2,1)=  suma_xy;
M1(2,2)=  suma_y2;
M1(2,3)=  suma_y;
M1(3,1)=  suma_x;
M1(3,2)=  suma_y;
M1(3,3)=  n;

M2(1,1)= -suma_x_x2_y2;
M2(2,1)= -suma_y_x2_y2;
M2(3,1)= -suma_x2_y2;

inversaM1=pinv(M1);
R=inversaM1*M2;
A=R(1);B=R(2);C=R(3);

