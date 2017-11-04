function aproxExponencial
%Limpio los parametros%
clc
clear all
%Arranco la funcion RECTA DE MINIMOS CUADRADOS%
x= input('Ingrese los "x" entre corchetes y separados por un espacio: ');
y= input('Ingrese los "y" entre corchetes y separados por un espacio: ');
n=length(x); %Cantidad de valores
%Inicio los valores de las sumatorias
sx= 0;
sY= 0;
sx2= 0;
sXY= 0;

%Hago las sumatorias correspondientes
for i=1:n
sx= sx + x(i);
sY = sY + log(y(i));
sx2= sx2 + x(i)^2;
sXY= sXY + x(i)*log(y(i));
endfor

A = sx2;
B = sx;
C = sx;
D = n;

%Resuelvo el sistema de ecuaciones con la matriz aumentada
Matriz1=[A B;C D];
Aumentada=[sXY;sY];
Incognita = inv(Matriz1)*Aumentada;
%muestro los valores incognitas
disp(Incognita)
%muestro la funcion
x1 = 0:0.3:10;
y1 = (exp(Incognita(2)) * exp(Incognita(1)*x1));
plot(x1,y1,'b-');
title('Grafica de la recta');
xlabel('Tiempo en segundos');
ylabel('Distancia en metros');
grid;
%fin
endfunction
