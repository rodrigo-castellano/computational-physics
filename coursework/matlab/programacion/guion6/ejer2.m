% Programa que muestra los factores de un numero
clc;clear;
numero = input('Introduzca un número(si no es entero se redondeará con floor): ');

while (numero<=0)
    numero=input('inserte un numero mayor que cero: ');
end

if (rem(numero,floor(numero))~=0)
    floor numero;
end


for i = 1:numero
    if (rem(numero,i)==0)
        disp([num2str(i),' es un factor']);
    end
end
