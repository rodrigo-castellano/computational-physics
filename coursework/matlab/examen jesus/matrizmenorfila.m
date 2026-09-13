function [v,pos]=matrizmenorfila(A)
    % Función que recibe una matriz y calcula para cada fila, el valor
    % menor de la misma. Devuelve un vector con los valores menores para
    % cada fila y un segundo vector con la posición del valor menor de cada
    % fila
    % Argumentos de entrada
    %    A: Matriz de entrada
    % Argumentos de salida
    %    v: vector con los valores menores para cada fila
    %    pos: posicion(columna) del valor menor de cada fila
    
    % Calculamos las dimensiones de la matriz (m->nº filas; n->nº columnas)
    [m,n]=size(A);
    
    % Recorremos cada fila de la matriz
    for i=1:m
        posmin=1;   % Declaramos la variable posmin donde se almacenará la columna del minimo para cada fila
        % Recorremos las columnas de la matriz(salvo la primera) para localizar el mínimo 
        for j=2:n
            % Si el valor es más pequeño que el mínimo almacenado,
            % actualizamos la variable posmin
            if (A(i,posmin)>A(i,j))
                posmin=j;
            end
        end
        % Construimos el vector con los minimos y sus posiciones(columnas)
        v(i)=A(i,posmin);
        pos(i)=posmin;
    end
end
