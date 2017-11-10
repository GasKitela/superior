function main = tpsuperior

  opcionPrincipal = menu("Elija una opcion",
                          "Aproximar",
                          "Comparar Aproximaciones",
                          "Finalizar");
                          
  x = input('Ingrese los "x" entre corchetes y separados por un espacio: ');
  y = input('Ingrese los "y" entre corchetes y separados por un espacio: ');
  dec = input('Ingrese la cantidad de decimales con que desea trabajar: '); 
      
  n = length(x);
  decimales = power(10, dec);
      
  switch opcionPrincipal
    
    case{1}
      metodoElegido = menu("Elija un metodo de aproximacion",
                           "Recta de minimos cuadrados", 
                           "Parabola de minimos cuadrados",
                           "Aproximacion exponencial",
                           "Aproximacion potencial",
                           "Aproximacion hiperbola");
      
      x = input('Ingrese los "x" entre corchetes y separados por un espacio: ');
      y = input('Ingrese los "y" entre corchetes y separados por un espacio: ');
      dec = input('Ingrese la cantidad de decimales con que desea trabajar: ');                 
      
      n = length(x);
      decimales = power(10, dec);
      
      switch metodoElegido
        case {1}
          [x, y, x1, y1, func] = minCuadPorRecta(x, y, n, decimales);
        case {2}
          [x, y, x1, y1, func] = minCuadPorParabola(x, y, n, decimales);
        case {3}
          [x, y, x1, y1, func] = aproxExponencial(x, y, n, decimales);
        case {4}
          [x, y, x1, y1, func] = aproxPotencial(x, y, n, decimales);
        case {5}
          [x, y, x1, y1, func] = aproxHiperbola(x, y, n, decimales);
      endswitch

      accionElegida = menu("¿Que desea hacer a continuacion?",
                           "Mostrar funcion aproximante",
                           "Obtener detalle del calculo",
                           "Graficar");
    
      switch accionElegida
        case {1}
          disp(func);
        case {2}
          detalleDeMetodo(metodoElegido, x, y, decimales);
        case {3}
          dibujarGrafico(x, y, x1, y1);
      endswitch
      
    case{2}
      compararAprox(x, y, n, decimales);
  
    case{3}
      exit 

  
  endswitch
  
endfunction