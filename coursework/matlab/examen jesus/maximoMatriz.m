function [maximo,filamax,columnamax] = maximoMatriz(A)
% Función que recibe una matriz e indica el valor mayor de dicha matriz y
% además la(s) posición(es) de dicho valor mayor (fila y columna)
% Argumentos de entrada
%   A: matriz de números 
% Argumentos de salida
%   maximo: valor mayor de la matriz A.
%   filamax: fila donde se encuentra el máximo de la matriz A
%   columnamax: columna donde se encuentra el máximo de la matriz A
% NOTA: filamax y columnamax pueden ser vectores si el máximo de la
% matriz se encuentra en varias posiciones

    % Calculamos las dimensiones de la matriz (m->nº filas; n->nº columnas)
    [m,n]=size(A);
    
    % Inicializamos la variable máximo donde se almacena el valor mayor de la matriz 
    maximo=-inf;
    
    % Recorremos la matriz A
    for i=1:m
        for j=1:n
            if (maximo < A(i,j))
                contador=1;          % Variable que almacena el número de máximos
                maximo=A(i,j);       % Actualizamos la variable maximo
                filamax(contador)=i;
                columnamax(contador)=j;
            elseif(maximo==A(i,j))   % Comprobamos si el valor mayor de A aparece en otras posiciones
                contador=contador+1; % En vez de usar un contador, se podría haber hecho concatenando las demás posiciones 
                filamax(contador)=i;
                columnamax(contador)=j;
            end
        end
    end
end

