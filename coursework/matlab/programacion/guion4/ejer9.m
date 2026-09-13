%EJERCICIO 9
clc
clear


%INICIALIZAICON Y LECTURA DE DATOS
A = 140; 
Kab = 1.6^-1;
Kel = 0.45^-1.;
t=[0:0.1:10]
Cp=-Inf

%CÁLCULOS
Cp=A*(Kab/(Kab-Kel))*(exp(-Kel.*t)-exp(Kab.*t));

%SALIDA DE RESULTADOS
plot(t,Cp);
xlabel('Tiempo (h)');
ylabel('Cp (mG/L)');
title('Cp vs T');