% Programa que...
clc
clear
 
% INICIALIZACIÓN Y LECTURA DE DATOS. CÁLCULOS.
x = input('Introduzca un número entre 0 y 5000: '); % Pido el primer número
while ((x < 0) || (x > 5000))
    x = input('El número introducido no está entre 0 y 5000. Por favor, introduzca un nuevo número: '); % Si el número introducido no está entre 0 y 5000, pido otro número
end
 
max = x; % Almaceno el primer número como máximo y mínimo
min = x;
 
for i = 1:9 % Pido los 9 número restantes
    x = input('Introduzca un número entre 0 y 5000: ');
    while ((x < 0) || (x > 5000))
        x = input('El número introducido no está entre 0 y 5000. Por favor, introduzca un nuevo número: ');
    end

    if (x > max)
        max = x; % Si el número introducido es mayor que el anterior, se actualiza este como máximo
    end

    if (x < min)
        min = x; % Si el número introducido es menor que el anterior, se actualiza este como mínimo
    end
end
 
disp(['El máximo valor introducido es ', num2str(max)]); % Muestro el máximo y el mínimo calculado
disp(['El mínimo valor introducido es ', num2str(min)]);