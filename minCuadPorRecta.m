function [retX, retY, retX1, retY1, func] = minCuadPorRecta(x, y, n, decimales);

%Limpio los parametros%
%clc
%clear all

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

Matriz1Inversa = inv(Matriz1);

Incognita = Matriz1Inversa*MatrizAumentada;

%muestro la funcion
a = Incognita(1);
b = Incognita(2);

x1 = 0:0.3:10;
y1 = (a*x1 + b);

retX = x;
retY = y;
retX1 = x1;
retY1 = y1;
func = cstrcat("funcion aproximante: ", num2str(fix(a*decimales)/decimales), "x + ", num2str(fix(b*decimales)/decimales), "\n");

endfunction