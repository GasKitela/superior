function main = tpsuperior

  metodo_elegido = menu("Elija un metodo de aproximacion lineal por funcion ",
                        "Recta de minimos cuadrados", 
                        "Parabola de minimos cuadrados",
                        "Aproximacion exponencial",
                        "Aproximacion potencial",
                        "Aproximacion hiperbola");
    
  switch metodo_elegido
    case {1}
      minCuadPorRecta;
 
    case {2}
      minCuadPorParabola;
      
    case {3}
      aproxExponencial;
      
    case {4}
      aproxPotencial;
      
    case {5}
      aproxHiperbola;
     
  endswitch

endfunction