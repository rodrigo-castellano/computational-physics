% relacion 7. 5.- Realice una función tal que dado un vector V y un valor d, indique si
% todos los elementos del vector son divisibles entre d o no.

function y=divisible(V,d)

esdivisible=true;
i=1;
while (esdivisible && i<=length(V)) 
    if rem(V(i),d)~=0
        esdivisible=false;
    end
    i=i+1;
end
y=esdivisible;

end