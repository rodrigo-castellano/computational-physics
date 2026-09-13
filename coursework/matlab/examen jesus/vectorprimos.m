function vprimo = vectorprimos(v)
    % Función que recibe un vector de números y devuelve solo los números 
    % primos (utilizando la función isprime para saber si un número es primo
    % o no) ordenados de menor a mayor
    % Argumentos de entrada
    %   v: vector de números 
    % Argumentos de salida
    %   vprimo: vector que contiene los números primos del vector v de
    %   entrada ordenados de menor a mayor
    
    l = length(v);
    contadorprimos = 0;
    
    % Recorremos el vector de números
    for i=1:l
        % Verificamos si dicho número es primo o no
        if (isprime(v(i)))
            contadorprimos = contadorprimos + 1;
            vprimo(contadorprimos) = v(i);
        end
    end
    
    % Ordenamos de menor a mayor el vector de números primos
    for i=1:contadorprimos
        posmin=i;
        for j=i+1:contadorprimos
            if (vprimo(posmin)>vprimo(j))
                posmin=j;
            end
        end
        
        % Intercambiamos las posiciones
        aux=vprimo(posmin);
        vprimo(posmin)=vprimo(i);
        vprimo(i)=aux;
    end
end
    
