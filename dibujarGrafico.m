function dibujarGrafico(x, y, x1, y1)

scatter(x, y, "filled");

hold on;

plot(x1, y1,'b-');

hold off;

title('Grafica de la recta de minimos cuadrados');
xlabel('Tiempo en segundos');
ylabel('Distancia en metros');

grid;
%fin

endfunction