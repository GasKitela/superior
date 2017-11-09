function [retX, retY, retX1, retY1, func] = aproxPotencial(x, y, n, decimales);

%Limpio los parametros%
%clc
%clear all

%Inicio los valores de las sumatorias
sX= 0;
sY= 0;
sX2= 0;
sXY= 0;

%Hago las sumatorias correspondientes
for i=1:n
  X = log(x(i));
  Y = log(y(i));  
  
  sX = sX + X;
  sY = sY + Y;
  sX2= sX2 + X^2;
  sXY= sXY + X*Y;
endfor

A = sX2;
B = sX;
C = sX;
D = n;

%Resuelvo el sistema de ecuaciones con la matriz aumentada
Matriz1=[A B;C D];
Aumentada=[sXY;sY];

Incognita = inv(Matriz1)*Aumentada;

%muestro la funcion
a = Incognita(1);
b = exp(Incognita(2));

x1 = 0:0.3:10;
y1 = (b * x1.^a);

retX = x;
retY = y;
retX1 = x1;
retY1 = y1;
func = cstrcat("funcion aproximante: ", num2str(fix(b*decimales)/decimales), "x^", num2str(fix(a*decimales)/decimales), "\n");

endfunction
