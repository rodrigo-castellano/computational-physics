%programa que halla si un entero es perfecto, abundante o deficiente
clear;clc;
%entrada de datos
numero = input('Introduzca un número(si no es entero se redondeará): ');
contador=0;
if (rem(numero,floor(numero))~=0)
    floor numero;
end
while (numero<=0)
    numero=input('inserte un numero mayor que cero: ');
end

%calculos
for i = 1:numero-1
    if (rem(numero,i)==0)
        contador=contador+1;
        V(contador)=i;
    end
end
sum_div=sum(V);
if (numero==(sum_div))
    disp('numero perfecto');
elseif (numero>sum_div)
    disp('numero abundante');
elseif (numero<sum_div)
    disp('numero deficiente');
end