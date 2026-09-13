%ej 13 programa que calcula el valor de pi

suma=0;
sum_rest=true;%tambien puedo usar un mas menos uno e ir cambiandole el signo
n=input('introduzca numero de iteraciones: ');
for i=0:n-1
    termino= 1/(2*i+1);
    if (sum_rest==true)
        suma=suma+termino;
    else
        suma=suma-termino;
    end
    sum_rest=~sum_rest;% aqui camiaria el signo
    
end
suma=4*suma;

disp(suma)
