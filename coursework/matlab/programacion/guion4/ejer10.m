%EJERCICIO 10
% programaInvierteCadena
% Introduce la cadena que deseas invertir: 'hola'
% La cadena invertida es: olah, y tiene 4 caracteres.]
clc 
clear
%INICIALIZAICON Y LECTURA DE DATOS
cadena=input('cadena de caracteres a invertir: ', 's');
%SALIDA DE RESULTADOS
disp(['la cadena introducida es: ',cadena]);
disp(['de longitud  ',num2str(size(cadena))]);
disp(['y revertida es: ',flip(cadena)]);