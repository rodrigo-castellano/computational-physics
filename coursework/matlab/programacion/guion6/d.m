%Programa que calcula la raiz hasta cierto termino
format longG;

%entrada de datos
clear;clc;
suma=0;
contador=0;
n=input('Introduce el numero de iteraciones: ');
numero=1;
fact=1;
termino=numero/fact;
x=input('Introduce el numero cuyo valor quieres obtener: ');
p=log(x)*0.5;
%calculos
for contador=1:n
    suma=suma+termino;
    
    numero=numero*p;
    fact=fact*contador;
    disp(['esstoy en la iteracion', num2str(contador), 'con suma ', num2str(suma), 'y con termino ', num2str(termino)]);
    pause
end

disp(suma);