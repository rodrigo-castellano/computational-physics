%relacion 7
%find
%any
%all
% 7.- Codifica una función que devuelva el término n-ésimo de la función de fi-bonacci. Después,
% completa una función que tome un vector conteniendo números de términos de la serie de Fibonacci
% deseados, y devuelva un vector con el valor de dichos términos. Por ejemplo si la función recibe 
% [1, 5, 3, 4, 2, 8] (esto es, término primero, término quinto, etc.), la función devolverá [0, 3, 1, 2, 1, 13]. 
% Haz después una alternativa donde ordenas el vector tomado, y calcu-las eficientemente los términos de 
% fibonacci del vector devuelto.

function s=fibo3(r)

r=ordenaSeleccion(r);
j=1;
s=zeros(1,length(r));
v(1)=0;
v(2)=1;%primeros terminos de la serie
for i=1:r(end)
    if i>2
        v(i)=v(i-1)+v(i-2);
    end
    if any(r==i) 
        s(j)=v(i);
        j=j+1;
    end
end