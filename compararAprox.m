function compararAprox;
  
%Limpio los parametros%
  clc
  clear all

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
 
  metodoElegido = 0;
  cont = 1;
  MatrizComparacion = [(1:n);x;y]'
  
  while metodoElegido != "Finalizar"
    metodoElegido = menu("Elija los metodos a comparar",
                         "Recta de minimos cuadrados", 
                         "Parabola de minimos cuadrados",
                         "Aproximacion exponencial",
                         "Aproximacion potencial",
                         "Aproximacion hiperbola",
                         "Finalizar");
    switch metodoElegido
      case {1}
        
        %Inicio los valores de las sumatorias RECTA
        sx= 0;
        sy= 0;
        sxy= 0;
        sx2= 0;

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
        
        Matriz1 = [A B;C D];
        MatrizAumentada = [sxy;sy];

        Matriz1Inversa = inv(Matriz1);

        Incognita = Matriz1Inversa*MatrizAumentada;

        a = Incognita(1);
        b = Incognita(2);

        x1 = 1:1:n;
        y1 = (a*x1 + b);
  
        MatrizComparacion = [MatrizComparacion , y1']
        
        
      case {2}
        %Inicio los valores de las sumatorias PARABOLA
        sx= 0;
        sy= 0;
        sxy= 0;
        sx2y= 0;
        sx2= 0;
        sx3= 0;
        sx4= 0;

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

        Matriz1=[D E F;E F G;F G H];
        Aumentada=[A; B; C];

        Incognita = inv(Matriz1)*Aumentada;

        a = Incognita(3);
        b = Incognita(2);
        c = Incognita(1); 

        x1 = 1:1:n;
        y1 = (a.*x1.^2 + b.*x1 + c);
        MatrizComparacion = [MatrizComparacion , y1']
        
      case {3}
        
       %Inicio los valores de las sumatorias EXPONENCIAL
        sx= 0;
        sY= 0;
        sx2= 0;
        sxY= 0;

        for i=1:n
          Y = log(y(i));
          
          sx= sx + x(i);
          sY = sY + Y;
          sx2= sx2 + x(i)^2;
          sxY= sxY + x(i)*Y;
        endfor

        A = sx2;
        B = sx;
        C = sx;
        D = n;

        Matriz1=[A B;C D];
        Aumentada=[sxY;sY];

        Incognita = inv(Matriz1)*Aumentada;

        a = Incognita(1);
        b = exp(Incognita(2));

        x1 = 1:1:n;
        y1 = (b * exp(a*x1));
        MatrizComparacion = [MatrizComparacion , y1']
        
      case {4}
        
        %Inicio los valores de las sumatorias POTENCIAL
        sX= 0;
        sY= 0;
        sX2= 0;
        sXY= 0;

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

        Matriz1=[A B;C D];
        Aumentada=[sXY;sY];

        Incognita = inv(Matriz1)*Aumentada;

        a = Incognita(1);
        b = exp(Incognita(2));

        x1 = 1:1:n;
        y1 = (b * x1.^a);
        MatrizComparacion = [MatrizComparacion , y1']
        
      case {5}
        %Inicio los valores de las sumatorias HIPERBOLA
        sx= 0;
        sy= 0;
        sxy= 0;
        sx2= 0;

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

        Matriz1 = [A B;C D];
        MatrizAumentada = [sxy;sy];

        Incognita = inv(Matriz1)*MatrizAumentada;

        a = 1/Incognita(1);
        b = Incognita(2)*a;

        x1 = 1:1:n;
        y1 = (a./(x1 + b));
        MatrizComparacion = [MatrizComparacion , y1']
        
      case {6}
        
        metodoElegido = "Finalizar";
        
    endswitch
    
  endwhile
    cont = cont +1; 
  endfunction
