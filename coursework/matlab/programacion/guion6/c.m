%Programa que calcula la exponencial de un numero con precision de 0.00005
format longG
%entrada de datos
clear;clc;
suma=0;
contador=0;
exponencial=input('Introduce el numero cuya exponencial quieres obtener: ');
numero=1;
fact=1;
termino=numero/fact;
suma=0;

%calculos
while (abs(numero/fact)>=0.00005) 
    suma=suma+numero/fact;
    
    contador=contador+1;
    fact=fact*contador;
    numero=numero*exponencial;
    pause
end

disp(suma);