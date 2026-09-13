%Programa que calcula la exponencial de un numero con precision de 0.00005

%entrada de datos
clear;clc;
suma=0;
contador=0;
numero=input('Introduce el numero cuya exponencial quieres obtener: ');
exponencial=numero;
suma=1; %iteraicion i=0;
fact=1;
%calculos
while (abs(numero/fact)>=0.00005) 
    contador=contador+1;
    fact=fact*contador;
    suma=suma+numero/fact;
    numero=numero*exponencial;
end

disp([num2str(suma),' es el valor de la exponencial']);