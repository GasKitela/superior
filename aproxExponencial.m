function [retX, retY, retX1, retY1, func] = aproxExponencial(x, y, n, decimales);
  
%Limpio los parametros%
%clc
%clear all

%Inicio los valores de las sumatorias
sx= 0;
sY= 0;
sx2= 0;
sxY= 0;

%Hago las sumatorias correspondientes
for i=1:n
  Y = log(y(i)); %separo en Y para no repetirla abajo y que sea mas legible :D
  
  sx= sx + x(i);
  sY = sY + Y;
  sx2= sx2 + x(i)^2;
  sxY= sxY + x(i)*Y;
endfor

A = sx2;
B = sx;
C = sx;
D = n;

%Resuelvo el sistema de ecuaciones con la matriz aumentada
Matriz1=[A B;C D];
Aumentada=[sxY;sY];

Incognita = inv(Matriz1)*Aumentada;

%muestro la funcion
a = Incognita(1);
b = exp(Incognita(2));

x1 = 0:0.3:10;
y1 = (b * exp(a*x1));

retX = x;
retY = y;
retX1 = x1;
retY1 = y1;
func = cstrcat("funcion aproximante: ", num2str(fix(b*decimales)/decimales), "e^", num2str(fix(a*decimales)/decimales), "x", "\n");

endfunction