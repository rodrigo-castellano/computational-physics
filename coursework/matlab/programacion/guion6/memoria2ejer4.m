%Programa que calcula la exponencial de un numero hasta que la precision sea 
%0.00005 o el numero de iteraciones sea 50.

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
while ((abs(termino)>=0.00005) | (contador<50))
    suma=suma+termino;
    
    contador=contador+1;
    fact=fact*contador;
    numero=numero*exponencial;
end

disp(suma);