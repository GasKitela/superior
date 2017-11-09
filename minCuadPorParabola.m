function [retX, retY, retX1, retY1, func] = minCuadPorParabola

%Limpio los parametros%
clc
clear all

%Arranco la funcion PARABOLA DE MINIMOS CUADRADOS%
x= input('Ingrese los "x" entre corchetes y separados por un espacio: ');
y= input('Ingrese los "y" entre corchetes y separados por un espacio: ');
dec = input('Ingrese la cantidad de decimales con que desea trabajar: ');

  switch dec
    case {1}
      decimales=10;
    case {2}
      decimales=100;
    case {3}
      decimales=1000;
    case {4}
      decimales=10000;
    case {5}
      decimales=100000;
    case {6}
      decimales=1000000;
    case {6}
      decimales=10000000;
    case {7}
      decimales=100000000;
    case {8}
      decimales=1000000000;
    case {9}
      decimales=10000000000;
  endswitch                  
             
             
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

%muestro la funcion
a = Incognita(3);
b = Incognita(2);
c = Incognita(1); %ESTE ES EL ORDEN CORRECTO --> CHEQUEADO CON EJEMPLO DE LA GUIA


a1 = fix(a*decimales)/decimales;
printf('a: %i\n', a1);


b1 = fix(b*decimales)/decimales;
printf('b: %i\n', b1);


c1 = fix(c*decimales)/decimales;
printf('c: %i\n', c1);

x1 = 0:0.3:40; 
y1 = (a.*x1.^2 + b.*x1 + c);

retX = x;
retY = y;
retX1 = x1;
retY1 = y1;
func = cstrcat("funcion aproximante: ", num2str(a), "x^2 + ", num2str(b), "x + ", num2str(c), "\n");

endfunction