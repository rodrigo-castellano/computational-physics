%relacion 6
%5.- Realice una función que escriba un número entero descompuesto en fac-tores primos.

function r=factores(n)
k=1;
for i=1:n
    if rem(n,i)==0
        r(k)=i;
        k=k+1;
    end
end
end