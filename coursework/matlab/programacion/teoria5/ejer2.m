%PROGRAMA PARA CALCULAR ORDEN DE NUMEROS
clc;clear;
%ENTRADA DE DATOS
x=input('introduzca numero 1: ');
y=input('introduzca numero 2: ');
z=input('introduzca numero 3: ');
a=0; %mayor
b=0;%del medio
c=0;%menor

%CALCULOS
if (x>y) & (x>z)   
    a=x;
    if (y>z)
        b=y;c=z;
    else
       c=y;b=z; 
    end
elseif(y>x) & (y>z)
    a=y;
    if (x>z)
        b=x;c=z;
    else
       c=x;b=z; 
    end
else
    a=z;
    if (y>x)
        b=y;c=x;
    else
       c=y;b=x; 
    end 
end

%SALIDA DE DATOS
disp(['de mayor a menor: ',num2str(a),num2str(b),num2str(c)]);