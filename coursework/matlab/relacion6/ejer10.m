clc;clear;
n=input('¿que termino quiere comprobar? ');

V(2)=1;
V(1)=0;
i=2;

for i=3:n
    V(i)=V(i-1)+V(i-2);
end
   

disp(V');
    