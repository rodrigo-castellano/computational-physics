%relacion6
% 1.- Codifica una función que reciba un vector de elementos y devuelva su me-dia
% geométrica (la raíz n-ésima de la multiplicación de los n valores, para un vector de tamaño n).

function y=mediageom(V)
prod=1;
n=length(V);
for i=1:n
    prod=prod*V(i);
end
y=nthroot(prod,n);
end