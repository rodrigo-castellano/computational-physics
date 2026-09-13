%Programa que calcula la exponencial de un numero hasta un 
%determinado numero de iteraciones

%entrada de datos
clear;clc;
suma=0;
contador=0;
exponencial=input('Introduce el numero cuya exponencial quieres obtener: ');
n=input('Introduce el numero de iteraciones: ');
numero=1;
suma=0; %iteraicion i=0;
fact=1;
%calculos
while (contador<n)
    suma=suma+numero/fact;
    numero=numero*exponencial;
    contador=contador+1;
    fact=fact*contador;
end

disp([num2str(suma),' es el valor de la exponencial ']);
