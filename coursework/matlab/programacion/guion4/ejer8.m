%EJERCICIO 8
clc
clear
% log10 (p) = b – 0.052323a/T
% ln(p)/ln(10)=b – 0.052323a/T

%INICIALIZAICON Y LECTURA DE DATOS
a = 34172; b = 7.9622;
T=273.15+[0:3:60];%para tenerlo en kelvin(SI)
%CÁLCULOS
P=10*exp(b-0.052323*a./T);
%sobrescribo p para tenerlo el mmHg
P=P*10^-3;
MATRIZ=[T-273.15;P]';
%SALIDA DE RESULTADOS
disp('Temp.(ºC) Presion(mmHg)');
disp(MATRIZ)
%a=10*exp(b-0.052323*a/60)