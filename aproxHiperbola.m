function [retX, retY, retX1, retY1, func] = aproxHiperbola(x, y, n, decimales);
 
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
  sy= sy + 1/y(i);
  sx2= sx2 + x(i)^2;
  sxy= sxy + x(i)*(1/y(i));
endfor

A = sx2;
B = sx;
C = sx;
D = n;

%Resuelvo el sistema de ecuaciones con la matriz aumentada
Matriz1 = [A B;C D];
MatrizAumentada = [sxy;sy];

Incognita = inv(Matriz1)*MatrizAumentada;

%muestro la funcion
a = 1/Incognita(1);
b = Incognita(2)*a;

x1 = 0:0.3:10;
y1 = (a./(x1 + b));

retX = x;
retY = y;
retX1 = x1;
retY1 = y1;
func = cstrcat("funcion aproximante: ", num2str(fix(a*decimales)/decimales), "/(x + ", num2str(fix(b*decimales)/decimales), ")", "\n");

endfunction