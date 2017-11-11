function crearCuadro(matrizVisualHermosa)
  col_width = max(cellfun (@numel, matrizVisualHermosa)) + 4;
  row_template = [sprintf("%%%is", col_width) "\n"];
  printf (row_template, matrizVisualHermosa'{:});
endfunction