function [v,pos]=matrizmenorfila2(M)
    % Función que recibe una matriz y calcula para cada fila, el valor
    % menor de la misma. Devuelve un vector con los valores menores para
    % cada fila y un segundo vector con la posición del valor menor de cada
    % fila
    % Argumentos de entrada
    %    A: Matriz de entrada
    % Argumentos de salida
    %    v: vector con los valores menores para cada fila
    %    pos: posicion(columna) del valor menor de cada fila
    [nfil,ncol]=size(M);
    for i=1:nfil
        v(i)=M(i,1);
        pos(i)=1;
        for j=1:ncol
            if M(i,j)<v(i)
                v(i)=M(i,j);
                pos(i)=j;
            end
        end
    end