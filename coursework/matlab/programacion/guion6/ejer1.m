% Programa que calcula el factorial de un número (emulando a la función 
%factorial() que ya existe en MATLAB
numero = input('Introduzca un número: ');
factorial = 1;
for i = 1:numero
    factorial = factorial * i;
end
disp(['El factorial del número ',num2str(numero),' es: ', num2str(factorial)]);