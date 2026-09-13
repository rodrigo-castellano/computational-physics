%ejercicio 8 relacion 5
clc;clear;
%entrada de datos
min=60000;max=-3;
%salida de datos

for i=1:10
    V(i)=input('introduzca un numero entre 0 y 5000: ');
    while ((V(i)<0) | (V(i)>5000))
        V(i)=input('por favor, introduzca un numero entre 0 y 5000: ');
    end 
    if V(i)<min
        min=V(i);
    elseif V(i)>max
        max=V(i);
    end
end
disp(['maximo y minimo son: ', num2str(max),' y ', num2str(min), '. Vector: ', num2str(V)])

    