function [maximo,filamax,columnamax] = maximoMatriz2(M)
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
[nfil,ncol]=size(M);
maximo=M(1,1);
for i=1:nfil
    for j=1:ncol
        if M(i,j)>maximo
            maximo=M(i,j);
            filamax=i;
            columnamax=j;
        end
    end
end
end
            
        