function minCuadPorParabola
%Limpio los parametros%
clc
clear all
%Arranco la funcion RECTA DE MINIMOS CUADRADOS%
x= input('Ingrese los "x" entre corchetes y separados por un espacio: ');
y= input('Ingrese los "y" entre corchetes y separados por un espacio: ');
n=length(x); %Cantidad de valores
%Inicio los valores de las sumatorias
sx= 0;
sy= 0;
sxy= 0;
sx2y= 0;
sx2= 0;
sx3= 0;
sx4= 0;
%Hago las sumatorias correspondientes
for i=1:n
sx= sx + x(i);
sy= sy + y(i);
sxy= sxy + x(i)*y(i);
sx2y= sx2y + x(i)^2*y(i);
sx2= sx2 + x(i)^2;
sx3= sx3 + x(i)^3;
sx4= sx4 + x(i)^4;
endfor
A = sy;
B = sxy;
C = sx2y;
D = n;
E = sx;
F = sx2;
G = sx3;
H = sx4;
%Resuelvo el sistema de ecuaciones con la matriz aumentada
Matriz1=[D E F;E F G;F G H];
Aumentada=[A; B; C];
Incognita = inv(Matriz1)*Aumentada;
%muestro los valores incognitas
disp(Incognita)
%muestro la funcion
x1 = 0:0.3:40; % aca deberia ser x1=x;?
y1 = (Incognita(1).*x1.^2 + Incognita(2).*x1 + Incognita(3));
plot(x1,y1,'b-');
title('Grafica de la recta');
xlabel('Tiempo en segundos');
ylabel('Distancia en metros');
grid;
%fin
endfunction