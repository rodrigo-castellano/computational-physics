%ejercicio que calcula si un numero esta en la serie de fibonacci
clc;clear;
%entrada de datos
n=input('¿que termino quiere comprobar? ');

%calculos y salida de datos
V(2)=1;
V(1)=0;
i=3;
while(V(i-1)<n)
    V(i)=V(i-1)+V(i-2);
    i=i+1;
end
   
if((V(i-1)==n)|((n==0)|(n==1)))
    disp('si coincide');
else
    ('no coincide');
end
 