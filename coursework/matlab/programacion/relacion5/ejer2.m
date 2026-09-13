% %ejercicio2
% 2.- Crear un script en MATLAB que reciba un valor x y devuelva el valor y de la función definida a trozos:
% 		sin(x) 		si x < 0
% y = 	x		si 0 <= x < 1
% 		x^2 + log(x) 	si x >= 1
clc
clear
%entrada de datos
x=input('introduzca x :');
y=-inf;
%operaciones
if (x<0)
    y=sin(x)
elseif (x<1)
    y=x;
else
    y=x^2+log(x);
end    
%salida de datos
disp(['valor de y ' ,num2str(y)])

%o menor igual que x enor igual que 10; cuando se evalua 0 menor igual que
%x lo que se devuelve internamentees un 1 o 0 que siempre es menor que 10

