function [retX, retY, retX1, retY1, func] = minCuadPorRecta

%Limpio los parametros%
clc
clear all

%Arranco la funcion RECTA DE MINIMOS CUADRADOS%
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

a1 = fix(a*decimales)/decimales;
printf('a: %i\n', a1);


b1 = fix(b*decimales)/decimales;
printf('b: %i\n', b1);

x1 = 0:0.3:10;
y1 = (a*x1 + b);

retX = x;
retY = y;
retX1 = x1;
retY1 = y1;
func = cstrcat("funcion aproximante: ", num2str(a), "x + ", num2str(b), "\n");

endfunction