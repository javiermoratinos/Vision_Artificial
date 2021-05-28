function [t, u, x, v, vc, i2, i1, F] = calcula_sistema(m, b, k, L, C, R, alfa, xi, vi, vci, i2i, tmax, h)
 %EUlER con paso de integracion h
 
 %Inicializo
 i = 1;
 t(i) = 0;
 u(i) = voltaje_entrada(t(i));
 
 %Variables de estado
 x(i) =xi;
 v(i) = vi;
 vc(i) = vci;
 i2(i) = i2i;
 
 %Variables algebraicas
 i1(t) = (u - vc(i)) / R;
 F(i) = alfa * i2(t);
 
 while t(i)<tmax
     %Calculo de derivadas en t
     derx = v(i);
     derv = (F(i) - k*x(i) - b*v(i))/m;
     deri2 = vc(i) / L;
     dervc = (i1(i) - i2(i))/C;
     
     %Calculo de variables de estado en t + h
     x(i+1) = x(i) + h * derx;
     v(i+1) = v(i) + h * derv;
     vc(i+1) = vc(i) + h * dervc;
     i2(i+1) = i2(i) + h * deri2;
     
     %Calculo de variables algebraicas en t + h
     u(i+1) = voltaje_entrada(t(i)+h);
     i1(i+1) = (u(i+1) - vc(i+1)) / R;
     F(i+1) = alfa * i2(i+1);
     
     %Actualizo el tiempo  a t + h
     t(i+1) = t(i) + h;
     i = i + 1;
end

