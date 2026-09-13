%%ejerc
clc;clear
%ENTRADA DE DATOS

%tengo que pedirle H Y H'  si la altura esta en h, hago un calculo y si
%esta en h' le sumo la parte de h
altura=input('diga altura: ');
h=19;
H_prima=14;
d1=25; 
r=12.5;
d2=46;
volumen=0;%inicializo
h_prima=altura-h;
r_prima= r + h_prima*(d2-d1)/H_prima;

%CALCULOS
if (altura<=h)
    volumen=pi*r^2*altura;
else
    volumen=pi*r^2*h+(1/3)*pi*h_prima*(r^2 + r*r_prima + r_prima^2); 
end

%SALIDA DE DATOS
disp(['el volumen es de ',num2str(volumen)]);

