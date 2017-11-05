function aproxPotencial

%Limpio los parametros%
clc
clear all

%Arranco la funcion APROX POTENCIAL%
x= input('Ingrese los "x" entre corchetes y separados por un espacio: ');
y= input('Ingrese los "y" entre corchetes y separados por un espacio: ');
dec = input('Ingrese la cantidad de decimales con que desea trabajar: ');

output_precision(dec); %NO SE SI CON ESTO ALCANZA PARA MANEJAR LO DE LOS DECIMALES
                       %ES SOLO PARA LO QUE MUESTRO X PANTALLA, NO TRUNCA RESULTADOS                       

n=length(x); %Cantidad de valores

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

%muestro los valores incognitas
disp(Incognita);

%muestro la funcion
a = Incognita(1);
b = Incognita(2);

x1 = 0:0.3:10;
y1 = (exp(b) * x1^a); %%xque exp el primero ? xque decia x1.^a ???      %%(exp(Incognita(2)) * x1.^(Incognita(1)));

scatter(x, y);

hold on;

plot(x1,y1,'b-');

hold off;

title('Grafica de la recta');
xlabel('Tiempo en segundos');
ylabel('Distancia en metros');

grid;
%fin

endfunction