function dibujaCirc(centro,R, color)
% Dibujar circunferencia a partir del centro y radio.
%Para sobreimpresionar visualizar previamente imagen con imshow(I); hold on

plot(centro(1),centro(2),[color, '+']);

i=1;
for theta=0 : 0.01 : 2*pi
    x(i)=centro(1)+R*cos(theta);
    y(i)=centro(2)+R*sin(theta);
    i=i+1;

end
hold on;
plot(x,y,[color, '-']); 

    