%1.- Genere un programa (script) que lea desde teclado un valor de Temperatura
%en grados Fahrenheit y lo devuelva en grados Celsius [C = (F-32)/1.8].
clc
clear

%INICIALIZAICONY LECTURA DE DATOS
fahrenheit= input ('Introduzca grados en fahrenheit: ');
celsius=-Inf;

%CALCULOS
celsius=(fahrenheit-32)/1.8;

%SALIDA DE RESILTADOS
disp([num2str(fahrenheit), ' grados fahrenheit son ',num2str(celsius), ' grados celsius']);
disp(sprintf([num2str(fahrenheit), ' grados fahrenheit son ',num2str(celsius), ' grados celsius']));