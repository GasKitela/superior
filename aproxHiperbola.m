function aproxHiperbola  
 
%Limpio los parametros%
clc
clear all

%Arranco la funcion RECTA DE MINIMOS CUADRADOS%
x= input('Ingrese los "x" entre corchetes y separados por un espacio: ');
y= input('Ingrese los "y" entre corchetes y separados por un espacio: ');
dec = input('Ingrese la cantidad de decimales con que desea trabajar: ');

output_precision(dec); %NO SE SI CON ESTO ALCANZA PARA MANEJAR LO DE LOS DECIMALES
                       %ES SOLO PARA LO QUE MUESTRO X PANTALLA, NO TRUNCA RESULTADOS
                       
n=length(x); %Cantidad de valores

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

%%muestro los valores incognitas
disp(Incognita);

%muestro la funcion
a = 1/Incognita(1);
b = Incognita(2)*a;

x1 = 0:1:9;
y1 = (a./(x1 + b));

scatter(x, y);

hold on;

plot(x1,y1,'b-');

hold off;

title('Grafica de la recta de minimos cuadrados');
xlabel('Tiempo en segundos');
ylabel('Distancia en metros');

grid;
%fin

endfunction