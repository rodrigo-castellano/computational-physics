%A)Twc = 13.112 + 0.6215Ta – 11.47v^0.16 + 0.3965Ta·v^0.16
%Como entradas, el programa pedirá al usuario los valores de Ta y de v. 
%Como salida, el programa visualizará el siguiente mensaje: “La sensación 
%térmica es de:  XX” (alternativamente en líneas separadas, lo que se prefiera). 
%Ejecutar como ejemplo el script para los valores T = 2ºC y v = 65km/h. 
clc
clear

%INICIALIZAICONY LECTURA DE DATOS
Twc=-Inf;
Ta=input ('Introduzca temp ambiente en grados: ');
v=input ('Introduzca velocidad del viento en m/s: ');

%CALCULOS
Twc=13.112 + 0.6215*Ta - 11.47*v^0.16 + 0.3965*Ta*v^0.16;

%SALIDA DE RESULTADOS
disp(['La sensación térmica es de: ',num2str(Twc),' grados']);
%disp(sprintf([num2str(fahrenheit), ' grados fahrenheit son ',num2str(celsius), ' grados celsius']));