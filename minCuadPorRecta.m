function MinCuadPorRecta
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
sx2= 0;
%Hago las sumatorias correspondientes
for i=1:n
sx= sx + x(i);
sy= sy + y(i);
sxy= sxy + x(i)*y(i);
sx2= sx2 + x(i)^2;
endfor
A = sx2;
B = sx;
C = sx;
D = n;
%Resuelvo el sistema de ecuaciones con la matriz aumentada
Matriz1 = [A B;C D];
MatrizAumentada = [sxy;sy];
Incognita = inv(Matriz1)*MatrizAumentada;

x1 = 0:0.3:10;
y1 = (Incognita(1)*x1 + Incognita(2));
plot(x1,y1,'b-');
title('Grafica de la recta de minimos cuadrados');
xlabel('Tiempo en segundos');
ylabel('Distancia en metros');
grid;
%fin
endfunction