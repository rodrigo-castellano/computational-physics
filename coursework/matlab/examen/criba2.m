function primos=criba2(n)
% a)Definir la lista de números enteros de 2 a n: enteros=2:n
% b) Incluir el 1 en la lista de números primos: primos=[1].
% c) El primer número en la lista de enteros es primo; incluirlo en la lista de primos y actualizar la lista
% de enteros eliminando todos los múltiplos de dicho número.
% d) Repetir el paso (c) hasta que no queden más números en la lista de enteros

enteros=2:n;  
primos =[1];  
    while length(enteros)>0 
        sicPrim=enteros(1) ; %primer elemento de la lista de enteros
        primos=[primos,sicPrim]; %se lo añado a la lista de numeros primos
        enteros1=[];
        for i=1:length(enteros) %para cada elemento de la lista de enteros
            if(rem(enteros(i),sicPrim)~=0) %recorre los divisores del primer elemento de la lista
                enteros1=[enteros1, enteros(i)]; %creo enteros1 q añade 
                disp(['iteracion ',num2str(i)]);
                disp(enteros1);
            end % if  
        end % for 
        enteros=enteros1;  
    end % while   
end % function
