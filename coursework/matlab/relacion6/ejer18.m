clc;clear;
n=input('¿que termino quiere comprobar? ');

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
 
    