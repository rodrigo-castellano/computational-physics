%18.- Realiza un programa que reciba un número natural y devuelva si éste pertenece o no a la sucesión de Fibonacci
clc;
num=input('introduce numero a comprobar');
i=1;
loes=true;
while(loes)
    if fibo(i)>=num
        loes=false;
    else
        i=i+1;
    end
end

if fibo(i)==num
    pertenece=true;
else 
    pertenece=false;
end

disp(pertenece);