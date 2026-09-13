function [D,correcto] = distorsion(A,B)
    % Función que calcula la distorsión    
    % Argumentos de entrada
    %   A: vector que contiene el número de votos obtenido por cada uno de
    %   los p partidos políticos
    %   B: vector que contiene el número de escaños obtenido por cada uno de
    %   los p partidos políticos
    % Argumentos de salida
    %   D: valor de la distorsión
    %   correcto: valor de verdad que devuelve false si el numero de los
    %   elementos de los vectores A y B no coincide. Si el programa no se
    %   puede ejecutar se devuelve D=-1
    
    % Comprobamos si la dimensión de los vectores A y B coincide
    if (length(A)~=length(B))
        correcto=false;
        D=-1;
    else
        correcto=true;
        
        % Sumamos el número total de votos y escaños mediante un ciclo for
        % (no hacemos uso de la función sum() de MATLAB)
        p=length(A);
        sumavotos=0;
        sumaescanos=0;
        for i=1:p
            sumavotos=sumavotos+A(i);
            sumaescanos=sumaescanos+B(i);
        end
        
        % Calculamos el porcentaje de votos y escaños de cada partido p
        % Para ahorrarnos un ciclo de repetición, aprovechamos el mismo
        % bucle para el cálculo de la distorsión D
        D=0;
        for i=1:p
            V(i)=A(i)/sumavotos;
            S(i)=B(i)/sumaescanos;
            D=D+abs(V(i)-S(i));
        end
        D=0.5*D*100;
    end
end
              