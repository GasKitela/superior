function compararAprox(x, y, n, decimales);
  
%Limpio los parametros%
%  clc
%  clear all
  
 
  metodoElegido = 0;
  %MatrizComparacion = [(1:n);x;y]'
  
  titulos = {"n" "x" "y"};

%  for i=1:n
%    visualMatrix = [visualMatrix; "-" num2str(n) num2str(x(i)) num2str(y(i))];
%  endfor

%  crearCuadro(visualMatrix);

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
        
        error = 0;
        for i=1:n
          error=error + (((a*x(i)+b)-y(i))^2);
        endfor

        x1 = 1:1:n;
        y1 = (a*x1 + b);
        
        visualMatrix = [titulos "Recta"];

        for i=1:n
          imat = i;
          xmat = x(i);
          ymat = y(i);
          y1mat = y1(i);
          
          visualMatrix = [visualMatrix; num2str(imat) num2str(xmat) num2str(ymat) num2str(y1mat)];
        endfor
        
        crearCuadro(visualMatrix);
        disp("\n");
        errorPorRecta = [fix((error)*decimales)/decimales]
        disp("\n");
        
        
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
        
        error=0;
        
        for i=1:n
        error=error + (((a*(x(i)^2)+b*x(i)+c)-y(i))^2);
        endfor

        x1 = 1:1:n;
        y1 = (a.*x1.^2 + b.*x1 + c);

        visualMatrix = [titulos "Parabola"];

        for i=1:n
          imat = i;
          xmat = x(i);
          ymat = y(i);
          y1mat = y1(i);
          
          visualMatrix = [visualMatrix; num2str(imat) num2str(xmat) num2str(ymat) num2str(y1mat)];
        endfor
        
        crearCuadro(visualMatrix);
        disp("\n");
        errorPorParabola = [fix((error)*decimales)/decimales]
        disp("\n");
        
        
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
        
        error = 0;
        for i=1:n
        error=error + (((b*e^(a*x(i))) - y(i))^2);
        endfor
        
        visualMatrix = [titulos "Exponencial"];

        for i=1:n
          imat = i;
          xmat = x(i);
          ymat = y(i);
          y1mat = y1(i);
          
          visualMatrix = [visualMatrix; num2str(imat) num2str(xmat) num2str(ymat) num2str(y1mat)];
        endfor
        
        crearCuadro(visualMatrix);
        disp("\n");
        errorPorExponencial = [fix((error)*decimales)/decimales]
        disp("\n");
        
        
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
        
        error = 0;
        for i=1:n
          error=error + (((b*(x(i)^a)) - y(i))^2);
        endfor
        
        visualMatrix = [titulos "Potencial"];

        for i=1:n
          imat = i;
          xmat = x(i);
          ymat = y(i);
          y1mat = y1(i);
          
          visualMatrix = [visualMatrix; num2str(imat) num2str(xmat) num2str(ymat) num2str(y1mat)];
        endfor
        
        crearCuadro(visualMatrix);
        disp("\n");
        errorPorPotencial = [fix((error)*decimales)/decimales]
        disp("\n");
      
      
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
        
        error = 0;
        
        for i=1:n
          error=error + (((a/(b+x(i))) - y(i))^2);
        endfor

        visualMatrix = [titulos "Hiperbola"];

        for i=1:n
          imat = i;
          xmat = x(i);
          ymat = y(i);
          y1mat = y1(i);
          
          visualMatrix = [visualMatrix; num2str(imat) num2str(xmat) num2str(ymat) num2str(y1mat)];
        endfor
        
        crearCuadro(visualMatrix);
        disp("\n");
        errorPorHiperbola = [fix((error)*decimales)/decimales]
        disp("\n");
      
      
      case {6}
        
        metodoElegido = "Finalizar";
        
    endswitch
    
  endwhile

endfunction
