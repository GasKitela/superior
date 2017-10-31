function main = sometest
  
  %(x, y) = ("Bienvenido! Para comenzar, ingrese un punto (x, y)\n");
  % carga de puntos (ver como se hace)
  
  metodo = menu("Elija un metodo de aproximacion",
                "Recta de minimos cuadrados", 
                "Parabola de minimos cuadrados",
                "Aproximacion exponencial",
                "Aproximacion potencial",
                "Aproximacion hiperbola");
  
  accion = menu(metodoelegido(metodo),
                "Mostrar funcion aproximante",
                "Detalle del calculo",
                "Visualizar distribucion de puntos");
 
  switch (accion)
    
    case 1
      prompt = {"Width", "Height", "Depth"};
      defaults = {"1.10", "1.10", "1.10"};
      rowscols = [2];
      dims = inputdlg (prompt, "Enter Box Dimensions", rowscols, defaults);
    case 2
      my_options = {"An item", "another", "yet another"};
      [sel, ok] = listdlg ("ListString", my_options,
                           "SelectionMode", "Multiple");
      if (ok == 1)
        disp ("You selected:");
        for i = 1:numel (sel)
          disp (sprintf ("\t%s", my_options{sel(i)}));
        endfor
      else
        disp ("You cancelled.");
      endif

  endswitch
  
endfunction




function metodoelegido = metodoelegido(x)
  
  switch (x)
    case 1
      metodoelegido = "Recta de minimos cuadrados";
    case 2
      metodoelegido = "Parabola de minimos cuadrados";
    case 3
      metodoelegido = "Aproximacion exponencial";
    case 4
      metodoelegido = "Aproximacion potencial";
    case 5
      metodoelegido = "Aproximacion hiperbola";
  endswitch

endfunction