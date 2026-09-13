%ej 14
m=0
n_1=input('introduzca el primer numero: ');
n_2=input('introduzca el segundo numero: ');
continuar=true;
while (continuar==true)
    opcion=input('escoja entre 1)sumar 2)restar 3)multiplicar 4)dividir 5)cambiar operandos 6)salir (o cualquier otro numero): ');
    if opcion==1
        n=n_1+n_2;
        disp(n)
    elseif opcion==2
        n=n_1-n_2;
        disp(n)
    elseif opcion==3
        n=n_1*n_2;
        disp(n)
    elseif opcion==4
        n=n_1/n_2;
        disp(n)
    elseif opcion==5
        n_1=input('introduzca el primer numero: ');
        n_2=input('introduzca el segundo numero: ');
    else
        continuar=false;
    end  
end