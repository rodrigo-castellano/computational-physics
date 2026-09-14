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

function s=fibo2(r)
clc
for i=1:length(r)
    s(i)=fibo(r(i));
end


end