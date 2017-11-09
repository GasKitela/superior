function detalleDeMetodo(metodo, x, y, decimales);
  
  switch metodo
    case {1}
      detalleRecta(x, y, decimales);
    case {2}
      detalleParabola(x, y, decimales);
    case {3}
      detalleExponencial(x, y, decimales);
    case {4}
      detallePotencial(x, y, decimales);
    case {5}
      detalleHiperbola(x, y, decimales);
  endswitch
  
endfunction



function detalleRecta(x, y, decimales)
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

    xRound = fix(x(i)*decimales)/decimales;
    yRound = fix(y(i)*decimales)/decimales;
    x2Round = fix((x(i)^2)*decimales)/decimales;
    xyRound = fix((x(i)*y(i))*decimales)/decimales;

    visualMatrix = [visualMatrix; "-" num2str(xRound) num2str(yRound) num2str(x2Round) num2str(xyRound)];  
  endfor
  
  sxRound = fix(sx*decimales)/decimales;
  syRound = fix(sy*decimales)/decimales;
  sxyRound = fix(sxy*decimales)/decimales;
  sx2Round = fix(sx2*decimales)/decimales;
  
  visualMatrix = [visualMatrix; "total" num2str(sxRound) num2str(syRound) num2str(sx2Round) num2str(sxyRound)];
  
  crearCuadro(visualMatrix);
endfunction



function detalleParabola(x, y, decimales)
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
  
    xRound = fix(x(i)*decimales)/decimales;
    yRound = fix(y(i)*decimales)/decimales;
    xyRound = fix((x(i)*y(i))*decimales)/decimales;
    x2yRound = fix((x(i)^2*y(i))*decimales)/decimales;
    x2Round = fix((x(i)^2)*decimales)/decimales;
    x3Round = fix((x(i)^3)*decimales)/decimales;
    x4Round = fix((x(i)^4)*decimales)/decimales;
  
    visualMatrix = [visualMatrix; "-" num2str(xRound) num2str(yRound) num2str(xyRound) num2str(x2yRound) num2str(x2Round) num2str(x3Round) num2str(x4Round)];  
  endfor

  sxRound= fix(sx*decimales)/decimales;
  syRound= fix(sy*decimales)/decimales;
  sxyRound= fix(sxy*decimales)/decimales;
  sx2yRound= fix(sx2y*decimales)/decimales;
  sx2Round= fix(sx2*decimales)/decimales;
  sx3Round= fix(sx3*decimales)/decimales;
  sx4Round= fix(sx4*decimales)/decimales;
    
  visualMatrix = [visualMatrix; "total" num2str(sxRound) num2str(syRound) num2str(sxyRound) num2str(sx2yRound) num2str(sx2Round) num2str(sx3Round) num2str(sx4Round)];
  
  crearCuadro(visualMatrix);
endfunction



function detalleExponencial(x, y, decimales)
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
    
    xRound = fix(x(i)*decimales)/decimales;
    yRound = fix(y(i)*decimales)/decimales;
    YRound = fix(Y*decimales)/decimales;
    x2Round = fix((x(i)^2)*decimales)/decimales;
    xYRound = fix((x(i)*Y)*decimales)/decimales;
    
    visualMatrix = [visualMatrix; "-" num2str(xRound) num2str(yRound) num2str(YRound) num2str(x2Round) num2str(xYRound)];  
  endfor
  
  sxRound= fix(sx*decimales)/decimales;
  syRound= fix(sy*decimales)/decimales;
  sYRound= fix(sY*decimales)/decimales;
  sx2Round= fix(sx2*decimales)/decimales;
  sxYRound= fix(sxY*decimales)/decimales;
  
  visualMatrix = [visualMatrix; "total" num2str(sxRound) num2str(syRound) num2str(sYRound) num2str(sx2Round) num2str(sxYRound)];
  
  crearCuadro(visualMatrix);
endfunction



function detallePotencial(x, y, decimales)
  n = length(x)

  visualMatrix = {"-" "xi" "yi" "Xi" "Yi" "Xi^2" "XiYi"};

  sx= 0;
  sy= 0;
  sX= 0;
  sY= 0;
  sX2= 0;
  sXY= 0;

  for i=1:n
    X = log(x(i));
    Y = log(y(i));
    
    sx = sx + x(i);
    sy = sy + y(i);
    sX = sX + X;
    sY = sY + Y;
    sX2= sX2 + X^2;
    sXY= sXY + X*Y;
  
    xRound = fix(x(i)*decimales)/decimales;
    yRound = fix(y(i)*decimales)/decimales;
    XRound = fix(X*decimales)/decimales;
    YRound = fix(Y*decimales)/decimales;
    X2Round = fix((X^2)*decimales)/decimales;
    XYRound = fix(X*Y*decimales)/decimales;
    
    visualMatrix = [visualMatrix; "-" num2str(xRound) num2str(yRound) num2str(XRound) num2str(YRound) num2str(X2Round) num2str(XYRound)];  
  endfor
  
  sxRound = fix(sx*decimales)/decimales;
  syRound = fix(sy*decimales)/decimales;
  sXRound = fix(sX*decimales)/decimales;
  sYRound = fix(sY*decimales)/decimales;
  sX2Round = fix(sX2*decimales)/decimales;
  sXYRound = fix(sXY*decimales)/decimales;
  
  visualMatrix = [visualMatrix; "total" num2str(sxRound) num2str(syRound) num2str(sXRound) num2str(sYRound) num2str(sX2Round) num2str(sXYRound)];  

  crearCuadro(visualMatrix);
endfunction



function detalleHiperbola(x, y, decimales)
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
    
    xRound = fix(x(i)*decimales)/decimales;
    yRound = fix(y(i)*decimales)/decimales;
    YRound = fix(Y*decimales)/decimales;
    x2Round = fix((x(i)^2)*decimales)/decimales;
    xYRound = fix(x(i)*Y*decimales)/decimales;
    
    visualMatrix = [visualMatrix; "-" num2str(xRound) num2str(yRound) num2str(YRound) num2str(x2Round) num2str(xYRound)];  
  endfor
    
    sxRound = fix(x(i)*decimales)/decimales;
    syRound = fix(x(i)*decimales)/decimales;
    sYRound = fix(x(i)*decimales)/decimales;
    sx2Round = fix(x(i)*decimales)/decimales;
    sxYRound = fix(x(i)*decimales)/decimales;
    
  visualMatrix = [visualMatrix; "total" num2str(sxRound) num2str(syRound) num2str(sYRound) num2str(sx2Round) num2str(sxYRound)];
  
  crearCuadro(visualMatrix);
endfunction



function crearCuadro(matrizVisualHermosa)
  col_width = max(cellfun (@numel, matrizVisualHermosa)) + 4;
  row_template = [sprintf("%%%is", col_width) "\n"];
  printf (row_template, matrizVisualHermosa'{:});
endfunction