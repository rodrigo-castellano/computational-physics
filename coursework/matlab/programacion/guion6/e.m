%Programa que calcula la raiz de un numero con precision indicada
format longG
%entrada de datos
suma=0;
contador=0;
n=input('Introduce la precision: ');
x=input('Introduce el numero cuya raiz quieres obtener: ');
numero=1;
fact=1;
termino=numero/fact;
p=log(x)*0.5;
%calculos
while (abs(numero/fact)>=n) 
    suma=suma+numero/fact;
    
    contador=contador+1;
    fact=fact*contador;
    numero=numero*p;
end

disp(suma);