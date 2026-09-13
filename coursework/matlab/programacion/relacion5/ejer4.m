%EJER4
%Realice un programa que reciba dos números y calcule el menor valor positivo 
%de entre esos dos. Si ambos son negativos devolverá 0.

%LECTURA DE DATOS

x=input('numero 1: ');
y=input('numero 2: ');

%CALCULO Y SALIDA

if (x<=0 && y<=0)
    disp('Resultado: 0');
elseif (x>0 && y>0)
    if (x>=y)
        disp(['resultado: ',num2str(y)]);
    else
        disp(['resultado: ',num2str(x)]);
    end
elseif (y <=0)
    disp(['resultado: ',num2str(x)]);
elseif (y>0)
    disp(['resultado: ',num2str(y)]);
end
      
    