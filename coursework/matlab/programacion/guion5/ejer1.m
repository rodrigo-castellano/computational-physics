%SUELDO DE  TRABAJADOR
clc;clear
%ENTRADA DE DATOS
h=input('horas trabajadas en la semana: ');
s=input('salario por hora que le corresponde: ');
sueldo=0;

%CALCULOS
sueldo=h*s;
if (h>40)
    sueldo= sueldo+(h-40)*s;
end

%SALIDA DE DATOS
disp(['el sueldo es de ',num2str(sueldo), ' euros ']);
