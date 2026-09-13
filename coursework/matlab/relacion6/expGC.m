%relacion 6

% 7.- Un modelo para crecimiento exponencial o descomposición de una canti-dad viene dado por:
% 		A(t) = A0ekt
% donde A(t) y A0 son las cantidades en el instante t y el instante 0, respectiva-mente, y k 
% es una constante única dependiente de la aplicación específica. 	Escribe una función en 
% MATLAB que use este modelo para predecir la cantidad A(t) en el instante t a partir del conocimiento
% de A0 y de A(t1) en un cierto instante t1. Utilizar la cabecera de función At = expGC(A0, At1, t1, t),
% donde el argumento de salida At se corresponde con A(t), y los argumentos de entrada A0, At1, t1, t, 
% se corresponden respectivamente con A0, A(t1), t1, y t respectivamente. 	Utilizar la función en la 
% línea de comandos para los dos siguientes casos:
% 	a) La población de México fue de 67 millones en el año 1980 y 79 millo-nes en el 1986. Estimar 
%     la población en el año 2000.
% 	b) La vida media de un material radiactivo es de 5.8 años. Cuánto que-dará de una cantidad de 
%     7 gramos tras 30 años

function At = expGC(A0, At1, t1, t)
k=log(At1/A0)*(1/t1)
At=A0*exp(k*t);
end