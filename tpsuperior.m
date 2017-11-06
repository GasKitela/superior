function main = tpsuperior

  metodoElegido = menu("Elija un metodo de aproximacion lineal por funcion ",
                       "Recta de minimos cuadrados", 
                       "Parabola de minimos cuadrados",
                       "Aproximacion exponencial",
                       "Aproximacion potencial",
                       "Aproximacion hiperbola");
  
  switch metodoElegido
    case {1}
      [x, y, x1, y1] = minCuadPorRecta;
      %proximoPaso(x, y, x1, y1);
    case {2}
      [x, y, x1, y1] = minCuadPorParabola;
      %proximoPaso(x, y, x1, y1);
    case {3}
      [x, y, x1, y1] = aproxExponencial;
      %proximoPaso(x, y, x1, y1);
    case {4}
      [x, y, x1, y1] = aproxPotencial;
      %proximoPaso(x, y, x1, y1);
    case {5}
      [x, y, x1, y1] = aproxHiperbola;
      %proximoPaso(x, y, x1, y1);
  endswitch

  accionElegida = menu("¿Que desea hacer a continuacion?",
                       "Mostrar funcion aproximante",
                       "Obtener detalle del calculo",
                       "Graficar");
  
  switch accionElegida
    case {1}
      disp("aca muestro la funcion");
    case {2}
      disp("aca detallo el calculo");
    case {3}
      dibujarGrafico(x, y, x1, y1);
  endswitch
                       
endfunction