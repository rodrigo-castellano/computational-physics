function y = media(x)
    % Función que calcula la media de los valores de un vector
    %Argumentos de entrada:
    % x: vector de entrada
    %Argumentos de salida:
    % y: media de los valores de x
     suma = 0;
     longitud = length(x);
     for i = 1:longitud
        suma = suma + x(i);
     end
     y = suma/longitud;
end
