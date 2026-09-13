
%5,-
clc
clear

%INICIALIZAICONY LECTURA DE DATOS
a= input ('Introduzca valor numerico a: ');
b= input ('Introduzca valor numerico b: ');
aux=-Inf;

%CALCULOS

aux=a;
a=b;
b=aux;

%SALIDA DE RESILTADOS
disp(sprintf(['Valor de a: ',num2str(a),'.\n Valor de b: ', num2str(b)]));