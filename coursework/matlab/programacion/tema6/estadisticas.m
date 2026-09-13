function [m,s] = estadisticas(x)
% Función stat que devuelve la media y desviación estándar
%de un vector de entrada
% Argumentos de entrada:
% x: vector de entrada
% Argumentos de salida:
% m: media de los valores de x
% s: desviación estándar de los valores de x
    n = length(x);
    m = sum(x)/n;
    s = sqrt(sum((x-m).^2/n));
end