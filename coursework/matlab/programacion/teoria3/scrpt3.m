%2.- Realice un programa que pida al usuario introducir dos valores numéricos 
%y calcule su suma, su resta, su producto y su división.
clc
clear

%INICIALIZAICONY LECTURA DE DATOS
num_1= input ('Introduzca valor numerico 1: ');
num_2= input ('Introduzca valor numerico 2: ');

%CALCULOS
suma=-Inf;
resta=-Inf;
prod=-Inf;
div=-Inf;


suma=num_1+num_2;
resta=num_1-num_2;
prod=num_1*num_2;
div=num_1/num_2;


%SALIDA DE RESILTADOS
%disp([num2str(fahrenheit), ' grados fahrenheit son ',num2str(celsius), ' grados celsius']);
disp(['suma: ',num2str(suma),'. resta: ',num2str(resta),'. producto: ',num2str(prod),'. division: ',num2str(div)]);
disp(sprintf(['suma: ',num2str(suma),'.\n resta: ',num2str(resta),'.\n producto: ',num2str(prod),'.\n division: ',num2str(div)]));

%para ponerlo en dos lineas si es muy largo
%disp(sprintf(['suma: ',num2str(suma),'.\n resta: ',num2str(resta),'.\n producto: ',...
    num2str(prod),'.\n division: ',num2str(div)]));


