function main = tpsuperior

  metodoElegido = menu("Elija un metodo de aproximacion lineal por funcion ",
                       "Recta de minimos cuadrados", 
                       "Parabola de minimos cuadrados",
                       "Aproximacion exponencial",
                       "Aproximacion potencial",
                       "Aproximacion hiperbola");
  
  switch metodoElegido
    case {1}
      [x, y, x1, y1, func] = minCuadPorRecta;
    case {2}
      [x, y, x1, y1, func] = minCuadPorParabola;
    case {3}
      [x, y, x1, y1, func] = aproxExponencial;
    case {4}
      [x, y, x1, y1, func] = aproxPotencial;
    case {5}
      [x, y, x1, y1, func] = aproxHiperbola;
  endswitch

  accionElegida = menu("¿Que desea hacer a continuacion?",
                       "Mostrar funcion aproximante",
                       "Obtener detalle del calculo",
                       "Graficar");
  
  switch accionElegida
    case {1}
      disp(func);
    case {2}
      detalleDeMetodo(metodoElegido, x, y);
    case {3}
      dibujarGrafico(x, y, x1, y1);
  endswitch
                       
endfunction