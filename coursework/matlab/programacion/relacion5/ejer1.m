%ejercicio1 tema5
%1.- Crear un script que lea un número y devuelva su valor absoluto (no utilizar la función abs de MATLAB).
clc
clear
%entrada de datos

%operaciones
a=input('Escribe un numero ');
if a<0
    b=-a;
end

%salida de datos
disp(['valor abs del numero ' ,num2str(b)])