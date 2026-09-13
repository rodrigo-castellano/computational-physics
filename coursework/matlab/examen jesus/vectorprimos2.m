function vprimo = vectorprimos(v)
    % Función que recibe un vector de números y devuelve solo los números 
    % primos (utilizando la función isprime para saber si un número es primo
    % o no) ordenados de menor a mayor
    % Argumentos de entrada
    %   v: vector de números 
    % Argumentos de salida
    %   vprimo: vector que contiene los números primos del vector v de
    %   entrada ordenados de menor a mayor
    k=1;
    for i=1:length(v)
        cont=0;
        for j=1:v(i)
            if rem(v(i),j)==0
                cont=cont+1;
            end
        end
        if (cont==2)
            vprimo(k)=v(i);
            k=k+1;
        end
        
    end