function detalleDeMetodo(metodo, x, y);
  
  switch metodo
    case {1}
      detalleRecta(x, y);
    case {2}
      detalleParabola(x, y);
    case {3}
      detalleExponencial(x, y);
    case {4}
      detallePotencial(x, y);
    case {5}
      detalleHiperbola(x, y);
  endswitch
  
endfunction



function detalleRecta(x, y)
  n = length(x)
  
  visualMatrix = {"-" "xi" "yi" "xi^2" "xiyi"};
  
  sx= 0;
  sy= 0;
  sxy= 0;
  sx2= 0;
  
  for i=1:n 
    sx= sx + x(i);
    sy= sy + y(i);
    sxy= sxy + x(i)*y(i);
    sx2= sx2 + x(i)^2;

    visualMatrix = [visualMatrix; "-" num2str(x(i)) num2str(y(i)) num2str(x(i)^2) num2str(x(i)*y(i))];  
  endfor
  
  visualMatrix = [visualMatrix; "total" num2str(sx) num2str(sy) num2str(sx2) num2str(sxy)];
  
  crearCuadro(visualMatrix);
endfunction



function detalleParabola(x, y)
  n = length(x)

  visualMatrix = {"-" "xi" "yi" "xiyi" "(xi^2)yi" "xi^2" "xi^3" "xi^4"};

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
  
    visualMatrix = [visualMatrix; "-" num2str(x(i)) num2str(y(i)) num2str(x(i)*y(i)) num2str(x(i)^2*y(i)) num2str(x(i)^2) num2str(x(i)^3) num2str(x(i)^4)];  
  endfor

  visualMatrix = [visualMatrix; "total" num2str(sx) num2str(sy) num2str(sxy) num2str(sx2y) num2str(sx2) num2str(sx3) num2str(sx4)];
  
  crearCuadro(visualMatrix);
endfunction



function detalleExponencial(x, y)
  n = length(x)

  visualMatrix = {"-" "xi" "yi" "Yi" "xi^2" "xiYi"};

  sx= 0;
  sy= 0;
  sY= 0;
  sx2= 0;
  sxY= 0;

  for i=1:n
    Y = log(y(i));
    
    sx = sx + x(i);
    sy = sy + y(i);
    sY = sY + Y;
    sx2= sx2 + x(i)^2;
    sxY= sxY + x(i)*Y;
    
    visualMatrix = [visualMatrix; "-" num2str(x(i)) num2str(y(i)) num2str(Y) num2str(x(i)^2) num2str(x(i)*Y)];  
  endfor

  visualMatrix = [visualMatrix; "total" num2str(sx) num2str(sy) num2str(sY) num2str(sx2) num2str(sxY)];
  
  crearCuadro(visualMatrix);
endfunction



function detallePotencial(x, y)
  n = length(x)

  visualMatrix = {"-" "xi" "yi" "Xi" "Yi" "Xi^2" "XiYi"};

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
  
    visualMatrix = [visualMatrix; "-" num2str(x(i)) num2str(y(i)) num2str(X) num2str(Y) num2str(X^2) num2str(x(i)*Y)];  
  endfor

  visualMatrix = [visualMatrix; "total" num2str(x(i)) num2str(y(i)) num2str(X) num2str(Y) num2str(X^2) num2str(x(i)*Y)];  

  crearCuadro(visualMatrix);
endfunction



function detalleHiperbola(x, y)
  n = length(x)

  visualMatrix = {"-" "xi" "yi" "1/yi" "xi^2" "Xi(1/Yi)"};

  sx= 0;
  sy= 0;
  sY= 0;
  sxY= 0;
  sx2= 0;

  for i=1:n
    Y = 1/y(i);

    sx= sx + x(i);
    sy= sy + y(i);
    sY= sY + Y;
    sx2= sx2 + x(i)^2;
    sxY= sxY + x(i)*Y;
    
    visualMatrix = [visualMatrix; "-" num2str(x(i)) num2str(y(i)) num2str(Y) num2str(x(i)^2) num2str(x(i)*Y)];  
  endfor

  visualMatrix = [visualMatrix; "total" num2str(sx) num2str(sy) num2str(sY) num2str(sx2) num2str(sxY)];
  
  crearCuadro(visualMatrix);
endfunction



function crearCuadro(matrizVisualHermosa)
  col_width = max(cellfun (@numel, matrizVisualHermosa)) + 4;
  row_template = [sprintf("%%%is", col_width) "\n"];
  printf (row_template, matrizVisualHermosa'{:});
endfunction